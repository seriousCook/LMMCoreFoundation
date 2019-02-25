//
//  NSObject+LMMFileManager.m
//  AFNetworking
//
//  Created by 马敬龙 on 2019/2/25.
//

#import "NSObject+LMMFileManager.h"

@implementation NSObject (LMMFileManager)

- (NSFileManager *)lmmManager
{
    return [NSFileManager defaultManager];
}

- (NSString *)lmm_Document
{
    NSString * sandBox = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return  sandBox;
}
//一般数据存储
- (NSString *)lmm_libraryCache
{
    NSString * sandBox = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return  sandBox;
}
//临时文件存储
- (NSString *)lmm_tmp
{
    return NSTemporaryDirectory();
}
//文件路径是否存在
- (BOOL)lmm_hasPath:(NSString *)path
{
    NSFileManager * manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:path];
}
//创建文件路径
- (BOOL)lmm_createPath:(NSString *)path
{
    BOOL isCreate = YES;
    if (![self lmm_hasPath:path]) {
        NSError * error;
        NSFileManager * manager = [NSFileManager defaultManager];
        isCreate = [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
        NSLog(@"LMM_<%@>createLocalCacheFail__:%@",NSStringFromSelector(_cmd),error);
        return isCreate;
    }
    return isCreate;
}

- (NSString *)lmm_DoumentWithSubpath:(NSString *)path
{
    NSString * allPath;
    NSString * document = [self lmm_Document];
    allPath = [document stringByAppendingPathComponent:path];
    BOOL isCreate = [self lmm_createPath:allPath];
    if (isCreate) {
        return allPath;
    }
    return nil;
}

- (NSString *)lmm_LibraryCacheWithSubpath:(NSString *)path
{
    NSString * allPath;
    NSString * document = [self lmm_libraryCache];
    allPath = [document stringByAppendingPathComponent:path];
    BOOL isCreate = [self lmm_createPath:allPath];
    if (isCreate) {
        return allPath;
    }
    return nil;
}

- (NSString *)lmm_tmpWithSubpath:(NSString *)path
{
    NSString * allPath;
    NSString * document = [self lmm_tmp];
    allPath = [document stringByAppendingPathComponent:path];
    BOOL isCreate = [self lmm_createPath:allPath];
    if (isCreate) {
        return allPath;
    }
    return nil;
}
//写入h数据
- (BOOL)lmm_writeFile:(id)file filePath:(NSString *)filePath
{
    BOOL writeSucc = NO;
    
    [file writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    if ([file isKindOfClass:NSArray.class]) {
        writeSucc = [(NSArray *)file writeToFile:filePath atomically:YES];
    } else if ([file isKindOfClass:NSDictionary.class]) {
        writeSucc = [(NSDictionary *)file writeToFile:filePath atomically:YES];
    } else if ([filePath isKindOfClass:UIImage.class]) {
        NSData  *data = UIImagePNGRepresentation((UIImage *)file);
        [data writeToFile:filePath atomically:YES];
    }
    return writeSucc;
}

- (BOOL)lmm_removeFile:(NSString *)filepath
{
    BOOL isRemove = NO;
    BOOL isHaveFilePath = [self lmm_hasPath:filepath];
    if (!isHaveFilePath) {
        isRemove = YES;
    }
    NSError * error;
    isRemove = [self.lmmManager removeItemAtPath:filepath error:&error];
    NSLog(@"LMM_<%@>removeLocalCacheFail__:%@",NSStringFromSelector(_cmd),error);
    return isRemove;
}



@end
