//
//  ReadJson.h
//  Motorcycle
//
//  Created by 韩敬 on 2019/6/15.
//  Copyright © 2019 YCKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReadJson : NSObject
+ (id)readLocalFileWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
