//
//  NSString+LMMAttribute.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/21.
//

#import "NSString+LMMAttribute.h"

@implementation NSString (LMMAttribute)

- (NSAttributedString *)lmm_setSelfWithAttrsBlock:(NSDictionary *(^)(void))attrsBlock
{
    if (self.length == 0) {
        return nil;
    }
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary * configDic = attrsBlock();
    [mStr addAttributes:configDic range:NSMakeRange(0, self.length)];
    
    return mStr;
}

- (NSAttributedString *)lmm_setAttrString:(NSString *)aStr attrsBlock:(NSDictionary * (^)(void))attrsBlock {
    if (self.length == 0) {
        return nil;
    }
    
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:aStr];
    NSDictionary * dic = attrsBlock();
    [mStr addAttributes:dic range:range];
    
    return mStr;
}

- (NSAttributedString *)lmm_setRange:(NSRange )range attrsBlock:(NSDictionary * (^)(void))attrsBlock {
    if (self.length == 0) {
        return nil;
    }
    
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary * dic = attrsBlock();
    [mStr addAttributes:dic range:range];
    
    return mStr;
}

- (NSAttributedString *)lmm_setAttrStrs:(NSArray <NSString *>*)strArray
                     configAttrsBlock:(NSArray<NSDictionary *> *(^)(void))configBlock {
    
    if (self.length == 0) {
        return nil;
    }
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSArray * configs = configBlock();
    
    int strCount = (int)strArray.count;
    int configCount = (int)configs.count;
    int count = strCount > configCount ? configCount : strCount;
    for (int i=0; i<count; i++) {
        NSString * aStr = strArray[i];
        
        if (!aStr) continue;
        //获取自定义范围 和 状态
        NSRange range = [self rangeOfString:aStr];
        NSDictionary * dic = configs[i];
        if (dic) {
            [mStr addAttributes:dic range:range];
        }
    }
    
    return mStr;
    
}

- (NSAttributedString *)lmm_setAttrStrs:(NSArray <NSString *>*)strs enumerateAttrsBlock:(NSDictionary *(^)(NSRange range, int strsIndex))attrsBlock {
    
    if (self.length == 0) {
        return nil;
    }
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    for (int i=0; i<strs.count; i++) {
        NSString * aStr = strs[i];
        
        if (!aStr) continue;
        
        NSRange range = [self rangeOfString:aStr];
        NSDictionary * dic = attrsBlock(range,i);
        if (dic) {
            [mStr addAttributes:dic range:range];
        }
    }
    
    return mStr;
}

- (NSAttributedString *)lmm_setRanges:(NSArray <NSValue *>*)strArray configAttrsBlock:(NSArray *(^)(void))configBlock {
    
    if (self.length == 0) {
        return nil;
    }
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSArray * configs = configBlock();
    
    int strCount = (int)strArray.count;
    int configCount = (int)configs.count;
    int count = strCount > configCount ? configCount : strCount;
    for (int i=0; i<count; i++) {
        
        NSRange range = [strArray[i] rangeValue];
        
        NSDictionary * dic = configs[i];;
        if (dic) {
            [mStr addAttributes:dic range:range];
        }
    }
    
    return mStr;
    
}

- (NSAttributedString *)lmm_setRanges:(NSArray <NSValue *>*)strs enumerateAttrsBlock:(NSDictionary *(^)(NSString* str, int strsIndex))attrsBlock {
    
    if (self.length == 0) {
        return nil;
    }
    NSMutableAttributedString * mStr = [[NSMutableAttributedString alloc] initWithString:self];
    for (int i=0; i<strs.count; i++) {
        NSRange range = [strs[i] rangeValue];
        
        NSDictionary * dic = attrsBlock([self substringWithRange:range],i);
        if (dic) {
            [mStr addAttributes:dic range:range];
        }
    }
    
    return mStr;
}

@end
