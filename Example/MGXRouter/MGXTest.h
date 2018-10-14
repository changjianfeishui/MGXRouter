//
//  MGXPerson.h
//  MGXRouter_Example
//
//  Created by Miu on 2018/10/13.
//  Copyright © 2018年 329735967@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGXTest : NSObject

+ (void)testClassMethod;
- (void)testObjectMethod;

+ (void)testClassMethod:(NSDictionary *)params;
- (void)testObjectMethod:(NSDictionary *)params;

//模拟单例
+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
