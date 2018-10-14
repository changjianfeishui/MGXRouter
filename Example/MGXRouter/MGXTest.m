//
//  MGXPerson.m
//  MGXRouter_Example
//
//  Created by Miu on 2018/10/13.
//  Copyright © 2018年 329735967@qq.com. All rights reserved.
//

#import "MGXTest.h"

@implementation MGXTest
+ (void)testClassMethod
{
    NSLog(@"%s",__func__);
}
- (void)testObjectMethod
{
    NSLog(@"%s",__func__);
}

+ (void)testClassMethod:(NSDictionary *)params
{
    NSLog(@"%s===%@",__func__,params);
}
- (void)testObjectMethod:(NSDictionary *)params
{
    NSLog(@"%s===%@",__func__,params);
}

//模拟单例
+ (instancetype)sharedInstance
{
    NSLog(@"%s",__func__);
    return [[self alloc]init];
}

@end
