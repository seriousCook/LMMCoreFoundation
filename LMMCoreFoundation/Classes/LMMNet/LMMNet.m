//
//  LMMNet.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import "LMMNet.h"
#import "AFNetworking.h"

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
    
}



@end
