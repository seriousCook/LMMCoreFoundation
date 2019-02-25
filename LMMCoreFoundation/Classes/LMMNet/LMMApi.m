//
//  LMMApi.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import "LMMApi.h"

@interface LMMApi()

@property (nonatomic, weak) LMMNet * net;

@end

@implementation LMMApi

/********可复写方法**********/

- (NSString *)apiURLHost
{
    return @"";
}

- (NSString *)apiURLPath
{
    return @"";
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


- (void)apiWithParams:(NSDictionary *)params callback:(void(^)(id, NSError *))callback
{
    self.net = LMMNet.Net;
    
    [self.net request:@""
               params:@{}
                 type:1
           serializer:1
               config:nil];
    
    
}


@end
