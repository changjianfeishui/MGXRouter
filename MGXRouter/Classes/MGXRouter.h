//
//  MGXRouter.h
//  Pods-MGXRouter_Example
//
//  Created by Miu on 2018/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGXRouter : NSObject

/**
 Target - Action 组件调度, 无需提前注册

 @param urlStr 比如: Router://Target/Action?userId=10000&name=admin
 @param params 调度参数,必须为NSDictionary类型
 @return 被调度者方法返回值, 即实际调用Action的返回值
 
 @discussion 同时支持两种参数传递形式, 若同时使用两种方式, 则会进行参数合并
 1. URL Query方式用于传递NSString类型参数
 2. NSDictionary支持非常规参数, 如图片,自定义对象等
 
 @discussion 由于单例的特殊性, 必须先获取单例对象,然后才能调用对象方法
 */
+ (id)openURL:(NSString *)urlStr params:(nullable NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
