//
//  NSString+LMMAttribute.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LMMAttribute)

/*
 *  设置自身
 */
- (NSAttributedString *)lmm_setSelfWithAttrsBlock:(NSDictionary *(^)(void))attrsBlock;

/**
 *  字符串自定义
 *  @param aStr         自定义的字符串
 *  @param attrsBlock   设置自定义状态
 *  @return             返回自定义字符串
 */
- (NSAttributedString *)lmm_setAttrString:(NSString *)aStr attrsBlock:(NSDictionary * (^)(void))attrsBlock;

/**
 *  字符串自定义
 *  @param range        自定义的字符串位置
 *  @param attrsBlock   设置自定义状态
 *  @return             返回自定义字符串
 */
- (NSAttributedString *)lmm_setRange:(NSRange )range attrsBlock:(NSDictionary * (^)(void))attrsBlock;

#pragma mark- 多项自定义内容
/**
 *  字符串自定义
 *  @param strArray     自定义的字符串数组
 *  @param configBlock  设置自定义状态数组
 *  @return             返回自定义字符串
 */
- (NSAttributedString *)lmm_setAttrStrs:(NSArray <NSString *>*)strArray
                     configAttrsBlock:(NSArray<NSDictionary *> *(^)(void))configBlock;

/**
 *  字符串自定义
 *  @param strArray     自定义的字符串数组
 *  @param attrsBlock   设置自定义状态数组
 *  @return             返回自定义字符串
 */
- (NSAttributedString *)lmm_setAttrStrs:(NSArray <NSString *>*)strArray
                  enumerateAttrsBlock:(NSDictionary *(^)(NSRange range, int strsIndex))attrsBlock;

/**
 *  字符串自定义
 *  @param rangeArray   自定义的字符串位置数组
 *  @param configBlock  设置自定义状态回调 @range 自定义字符串的位置 @strsIndex 数组中的index
 *  @return             部分被自定义的字符串
 */
- (NSAttributedString *)lmm_setRanges:(NSArray <NSValue *>*)rangeArray configAttrsBlock:(NSArray *(^)(void))configBlock;

/**
 *  字符串自定义
 *  @param rangeArray  自定义的字符串位置数组
 *  @param attrsBlock  设置自定义状态回调 @range 自定义字符串的位置 @strsIndex 数组中的index
 *  @return             部分被自定义的字符串
 */
- (NSAttributedString *)lmm_setRanges:(NSArray <NSValue *>*)rangeArray
                enumerateAttrsBlock:(NSDictionary *(^)(NSString* str, int strsIndex))attrsBlock;

@end

NS_ASSUME_NONNULL_END
