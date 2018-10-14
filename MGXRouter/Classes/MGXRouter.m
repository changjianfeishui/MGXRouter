//
//  MGXRouter.m
//  Pods-MGXRouter_Example
//
//  Created by Miu on 2018/10/12.
//

#import "MGXRouter.h"

@implementation MGXRouter
#pragma mark Target - Action
+ (id)openURL:(NSString *)urlStr params:(NSDictionary *)params
{
    //解析URL
    NSURL * url = [NSURL URLWithString:urlStr];
    //解析Target
    NSString *targetName = url.host;
    //解析Action
    NSArray *actionNames = [url.path componentsSeparatedByString:@"/"];
    //解析query参数
    NSString *queryString = [url query];
    NSMutableDictionary *urlParams = [[NSMutableDictionary alloc] init];
    for (NSString *param in [queryString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [urlParams setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    //最终参数 = url拼接参数 + 直接传递的params
    NSMutableDictionary *finalParams = [[NSMutableDictionary alloc]initWithDictionary:urlParams];
    [finalParams setValuesForKeysWithDictionary:params];
    
    NSString *actionName;
    //解析单例
    if (actionNames.count == 3) {        
        NSString *singletonActionName = actionNames[1];
        actionName = actionNames[2];
        NSString *singletonURL = [NSString stringWithFormat:@"Router://%@/%@",targetName,singletonActionName];
        id target = [self openURL:singletonURL params:nil];
        
        //带参数的方法调用需要拼接:
        if (finalParams.count > 0 || params != nil) {
            actionName = [actionName stringByAppendingString:@":"];
        }else{
            finalParams = nil;
        }
        
        return [self safePerformAction:NSSelectorFromString(actionName) target:target params:finalParams];
    }
    actionName = [actionNames[1] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    //带参数的方法调用需要拼接:
    if (finalParams.count > 0 || params != nil) {
        actionName = [actionName stringByAppendingString:@":"];
    }else{
        finalParams = nil;
    }
    return [self performTarget:targetName action:actionName params:finalParams];
}

+ (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    Class targetClass = NSClassFromString(targetName);
    SEL action = NSSelectorFromString(actionName);
    //判断是类方法还是对象方法
    if ([targetClass respondsToSelector:action]) {
        return [self safePerformAction:action target:targetClass params:params];
    }else {
        NSObject *target = [[targetClass alloc] init];
        if (target&&[target respondsToSelector:action]) {
            return [self safePerformAction:action target:target params:params];
        }
    }
    return [self show404:targetName action:actionName];
}

+ (id)show404:(NSString *)target action:(NSString *)action
{
    //可自定义错误处理规范
    NSLog(@"路由调用失败,target=%@,action=%@",target,action);
    return nil;
}

+ (id)safePerformAction:(SEL)action target:(id)target params:(NSDictionary *)params
{
    NSMethodSignature* methodSign = [target methodSignatureForSelector:action];
    if(methodSign == nil) {
        return nil;
    }
    const char* retType = [methodSign methodReturnType];
    
    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
        if (params) {
            [invocation setArgument:&params atIndex:2];
        }
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
        if (params) {
            [invocation setArgument:&params atIndex:2];
        }
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
        if (params) {
            [invocation setArgument:&params atIndex:2];
        }
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
        if (params) {
            [invocation setArgument:&params atIndex:2];
        }
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
        if (params) {
            [invocation setArgument:&params atIndex:2];
        }
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

@end
