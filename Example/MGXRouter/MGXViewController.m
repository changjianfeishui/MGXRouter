//
//  MGXViewController.m
//  MGXRouter
//
//  Created by 329735967@qq.com on 10/12/2018.
//  Copyright (c) 2018 329735967@qq.com. All rights reserved.
//

#import "MGXViewController.h"
#import <MGXRouter/MGXRouter.h>

@implementation MGXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *param = @{@"name":@"jobs"};
    //调用不带参数的类方法
    [MGXRouter openURL:@"Router://MGXTest/testClassMethod" params:nil];
    //调用带参数的类方法
    [MGXRouter openURL:@"Router://MGXTest/testClassMethod" params:param];
    //调用不带参数的对象方法
    [MGXRouter openURL:@"Router://MGXTest/testObjectMethod" params:nil];
    //调用带参数的对象方法
    [MGXRouter openURL:@"Router://MGXTest/testObjectMethod?name=jobs&age=14" params:nil];

    //调用单例 - 带参数
    [MGXRouter openURL:@"Router://MGXTest/sharedInstance/testObjectMethod?age=13" params:@{}];
    //调用单例 - 不带参数
    [MGXRouter openURL:@"Router://MGXTest/sharedInstance/testObjectMethod" params:nil];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
