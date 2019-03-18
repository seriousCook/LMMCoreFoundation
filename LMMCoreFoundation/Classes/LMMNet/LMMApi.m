//
//  LMMApi.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import "LMMApi.h"

@interface LMMApi()

@property (nonatomic, strong) LMMNet * net;

@end

@implementation LMMApi

+ (instancetype)API
{
    return [[self alloc] init];
}

/********可复写方法**********/

- (NSString *)apiURLHost
{
    return nil;
}

- (NSString *)apiURLPath
{
    return nil;
}

- (RequestType)apiReqeustType
{
    return GET;
}

- (NSURLSessionConfiguration *)apiSessionConfiguration
{
    return nil;
}

- (NSDictionary *)apiHandleParam:(NSDictionary *)params
{
    return params;
}

- (RequestSerializer)apiRequestSerializer
{
    return DefaultRequestSerializer;
}

- (Class)apiResponseHandlerCalss
{
    return nil;
}


- (id)apiObjectWithResponse:(id)responseObject error:(NSError *)error net:(LMMNet *)net
{
    return responseObject;
}

/********可复写方法**********/

- (void)apiCancel
{
    [self.net cancle];
}

- (void)apiWithParams:(NSDictionary *)params callback:(void(^)(id, NSError *))callback
{
    [self _apiWithParams:params progress:nil callback:callback];
}


- (void)apiWithParams:(NSDictionary *)params progress:(void(^)(NSProgress *))progress callback:(void(^)(id, NSError *))callback
{
    [self _apiWithParams:params progress:progress callback:callback];
}

#pragma mark- private---
- (void)_apiWithParams:(NSDictionary *)params progress:(void(^)(NSProgress *))progress callback:(void(^)(id, NSError *))callback
{
    self.net = LMMNet.Net;
    
    [self.net request:[NSString stringWithFormat:@"%@",self.apiURLHost]
               params:[self apiHandleParam:params]
                 type:self.apiReqeustType
           serializer:self.apiRequestSerializer
               config:self.apiSessionConfiguration];
    
    [self.net response:progress
              callback:^(LMMNet * _Nonnull net, id  _Nonnull responseObject, NSError * _Nonnull error) {
                  id object = [self apiObjectWithResponse:responseObject error:error net:self.net];
                  if (callback) {
                      callback(object,error);
                  }
    }];
    
    [self.net start];
}


@end
