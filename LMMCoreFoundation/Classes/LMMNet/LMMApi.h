//
//  LMMApi.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/22.
//

#import <Foundation/Foundation.h>
#import "LMMNet.h"
NS_ASSUME_NONNULL_BEGIN

@interface LMMApi : NSObject

@property (nonatomic, weak, readonly) LMMNet * net;

/********可复写方法**********/

/**
*   返回URL域名或IP
*/
- (NSString *)apiURLHost;

/**
 *  返回url地址路径
 */
- (NSString *)apiURLPath;

/**
 *  返回请求类型，GET、POST....
 */
- (RequestType)apiReqeustType;

/**
 *  api配置
 */
- (NSURLSessionConfiguration *)apiSessionConfiguration;

/**
 *  设置参数
 */
- (NSDictionary *)apiHandleParam:(NSDictionary *)params;

/**
 *  设置请求参数模式，JSON，URL表单
 */
- (RequestSerializer)apiRequestSerializer;

/**
 *  返回响应数据类型
 */
- (Class)apiResponseHandlerCalss;

/**
 *  处理结果数据
 */
- (id)apiObjectWithResponse:(id)responseObject error:(NSError *)error net:(LMMNet *)net;

/********可复写方法**********/

/**
 *
 */
- (void)apiCancel;

@end

NS_ASSUME_NONNULL_END
