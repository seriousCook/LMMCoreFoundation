//
//  LMMNet.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import "LMMNet.h"
#import "AFNetworking.h"
#import "LMMResponseHandlerProtocol.h"
#import "LMMResponseHandler.h"
@interface LMMNet ()

@property (nonatomic, copy) NSString *url; //请求的URL String
@property (nonatomic, copy) NSDictionary *params; //请求的参数
@property (nonatomic) RequestSerializer rs;//参数类型
@property (nonatomic) RequestType type;//请求类型
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;//请求配置，不设置则采用通用的。
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;//请求task
@property (nonatomic) Class handler;  //数据结果处理者
@property (nonatomic, copy) ProgressCallback progressCallback;
@property (nonatomic, copy) NetCallback callback; //请求的response回调

@end

@implementation LMMNet

+ (LMMNet *)Net {
    return [[LMMNet alloc] init];
}

- (void)cancle {
    [self.dataTask cancel];
}

- (void)request:(NSString *)url
         params:(NSDictionary *)params
           type:(RequestType)type
     serializer:(RequestSerializer)rs
         config:(NSURLSessionConfiguration *)config
{
    self.url = url;
    self.params = params.copy;
    self.type = type;
    self.rs = rs;
    self.configuration = config;
}

- (void)response:(ProgressCallback)progressCallback callback:(NetCallback)callback
{
    self.progressCallback = progressCallback;
    self.callback = callback;
}

- (void)start {
    
    
    void (^success)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleResponseTask:task object:responseObject error:nil];
    };
    
    void (^fail)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        [self handleResponseTask:task object:nil error:error];
    };
    
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:self.configuration];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (self.rs == JSONRequestSerializer) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    
    switch (self.type) {
            case GET:
                self.dataTask = [manager GET:self.url parameters:self.params progress:self.progressCallback success:success failure:fail];
            break;
            
            case POST:
                self.dataTask = [manager POST:self.url parameters:self.params progress:self.progressCallback success:success failure:fail];
            break;
            
        default:
            break;
    }
    
}

- (void)handleResponseTask:(NSURLSessionDataTask *)task object:(id)object error:(NSError *)error
{
    self.dataTask = task;
    id<LMMNetResponseHandlerProtocol> handlerInstance;
    if (self.handler) {
        handlerInstance = [[self.handler alloc] init];
    } else {
        handlerInstance = [[LMMResponseHandler alloc] init];
    }
    //如果协议对象存在&&实现了协议反复，先走协议处理，处理特定的
    if (handlerInstance && [handlerInstance respondsToSelector:@selector(lmm_handleResponse:object:error:resultCallback:)]) {
        [handlerInstance lmm_handleResponse:self object:object error:error resultCallback:self.callback];
    } else {
        self.callback(self, object, error);
    }
}



@end
