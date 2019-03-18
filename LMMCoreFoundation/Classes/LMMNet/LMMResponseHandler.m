//
//  LMMResponseHandler.m
//  AFNetworking
//
//  Created by 马敬龙 on 2019/2/23.
//

#import "LMMResponseHandler.h"


//NSString * const kLMMNetResponseCodeKey = @"res";
//NSString * const kLMMNetResponseDataKey = @"params";
//NSString * const kLMMNetResponseMessageKey = @"msg";

//服务器返回的错误Domain
NSString * const kLMMNetServerFormatErrorDomain = @"LMMServerFormatErrorDomain";
NSString * const kLMMNetServerBusinessErrorDomain = @"LMMServerBusinessErrorDomain";
NSString * const kLMMNetServerNotLoginErrorDomain = @"LMMServerNotLoginErrorDomain";


NSInteger const kLMMNetFormatErrorCode = -10086;
NSString * const kLMMNetServerFormatErrorMessage = @"本地自定义：网络服务错误";

@implementation LMMResponseHandler
- (void)lmm_handleResponse:(LMMNet *)net object:(id)object error:(NSError *)error resultCallback:(void (^)(LMMNet *, id, NSError *))callback {
    if (error && error.code == -999) { //网络请求取消处理
        
    } else if (error) { //其他网络错误处理
        if (callback) {
            callback(net, nil, error);
        }
    } else {//正确情况的处理 比如服务器返回错误code 需要自定义一些NSError
        error = [self _errorWithObject:object net:net];
        if (callback) {
            callback(net, object, error);
        }
    }
}


- (NSError *)_errorWithObject:(NSDictionary *)object net:(LMMNet *)net{
    
    NSError * error = nil;
    //如果返回的不是字典，则表示服务错误
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        return error;
    } else {
        error = [NSError errorWithDomain:kLMMNetServerFormatErrorDomain code:kLMMNetFormatErrorCode userInfo:@{NSLocalizedDescriptionKey: kLMMNetServerFormatErrorMessage}];

    }
    return error;
}

@end
