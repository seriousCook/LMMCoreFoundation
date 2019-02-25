//
//  LMMNet.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class LMMNet;

typedef NS_ENUM(NSUInteger, RequestType) {
    GET,
    POST,
    HEAD,
    PUT,
    PATCH,
    DELETE
};

typedef NS_ENUM(NSUInteger, RequestSerializer) {
    DefaultRequestSerializer,
    JSONRequestSerializer,
};

typedef void(^NetCallback)(LMMNet *net, id responseObject, NSError *error);

typedef void (^ProgressCallback)(NSProgress *progress);

@interface LMMNet : NSObject

+ (LMMNet *)Net;

- (void)request:(NSString *)url
         params:(NSDictionary *)params
           type:(RequestType)type
     serializer:(RequestSerializer)rs
         config:(NSURLSessionConfiguration *)config;

@end

NS_ASSUME_NONNULL_END
