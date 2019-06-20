//
//  LMMStandardApi.m
//  LMMCoreFoundation_Example
//
//  Created by 马敬龙 on 2019/2/24.
//  Copyright © 2019年 马敬龙. All rights reserved.
//

#import "LMMStandardApi.h"

@implementation LMMStandardApi

-(NSString *)apiURLHost
{
    return @"http://mnks.jxedt.com/ckm1/get_question";
    
}

- (RequestType)apiReqeustType
{
    return GET;
}

- (NSURLSessionConfiguration *)apiSessionConfiguration
{
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    return config;
}

- (NSDictionary *)apiHandleParam:(NSDictionary *)params
{
    return params;
    NSMutableDictionary * handlerDict = [[NSMutableDictionary alloc] init];
    [handlerDict setObject:[self apiURLPath] forKey:@"action"];
    
    NSMutableDictionary * newParams = [[NSMutableDictionary alloc] initWithDictionary:params];
    NSString * udid = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    [newParams setObject:udid forKey:@"deviceId"];
    [newParams setObject:@"1" forKey:@"deviceType"];
    [newParams setObject:@"" forKey:@"userId"];
    
    [handlerDict setObject:newParams forKey:@"params"];
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:handlerDict options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return @{@"param":jsonString};
}

@end
