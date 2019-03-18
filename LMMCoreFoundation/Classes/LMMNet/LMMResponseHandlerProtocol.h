//
//  LMMResponseHandlerProtocol.h
//  Pods
//
//  Created by 马敬龙 on 2019/2/23.
//

#import <Foundation/Foundation.h>

@class LMMNet;
@protocol LMMNetResponseHandlerProtocol <NSObject>

- (void)lmm_handleResponse:(LMMNet *)net object:(id)object error:(NSError *)error resultCallback:(void(^)(LMMNet *net, id responseObject, NSError *error))callback;

@end
