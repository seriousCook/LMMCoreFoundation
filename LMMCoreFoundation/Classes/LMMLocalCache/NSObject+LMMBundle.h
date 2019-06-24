//
//  NSObject+LMMBundle.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LMMBundle)

//读取bundle Json数据
- (id)lmm_readBundleJsonFileWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
