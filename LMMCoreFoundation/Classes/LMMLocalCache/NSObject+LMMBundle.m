//
//  NSObject+LMMBundle.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/6/21.
//

#import "NSObject+LMMBundle.h"

@implementation NSObject (LMMBundle)

- (id)lmm_readBundleJsonFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


@end
