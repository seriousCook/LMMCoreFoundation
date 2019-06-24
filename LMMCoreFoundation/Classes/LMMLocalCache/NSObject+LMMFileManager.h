//
//  NSObject+LMMFileManager.h
//  AFNetworking
//
//  Created by 马敬龙 on 2019/2/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  缓存方式：NSUserDefault、沙盒、归档、sqlite、coreData
 *  这里只是只是封装了沙盒缓存
 *  sqlite: 可以使用 FMDB、YTKKeyValueStore
 *  归档: 没必要封装
 *  coreData
 */
@interface NSObject (LMMFileManager)

/**
 *  获取沙盒路径，分为：Document、libraryCache、tmp
 */
- (NSString *)lmm_Document;

- (NSString *)lmm_libraryCache;

- (NSString *)lmm_tmp;


/**
 *  路径是否存在
 */
- (BOOL)lmm_hasPath:(NSString *)path;

/**
 *  创建路径，需指定完整路径
 */
- (BOOL)lmm_createPath:(NSString *)path;

/**
 *  生成路径
 */
- (NSString *)lmm_DoumentWithSubpath:(NSString *)path;

- (NSString *)lmm_LibraryCacheWithSubpath:(NSString *)path;

- (NSString *)lmm_tmpWithSubpath:(NSString *)path;

/**
 *  写入沙盒，可写入：字符串、图片、字典、数组
 */
- (BOOL)lmm_writeFile:(id)file filePath:(NSString *)filePath;



@end

NS_ASSUME_NONNULL_END
