# MGXRouter

[![CI Status](https://img.shields.io/travis/329735967@qq.com/MGXRouter.svg?style=flat)](https://travis-ci.org/329735967@qq.com/MGXRouter)
[![Version](https://img.shields.io/cocoapods/v/MGXRouter.svg?style=flat)](https://cocoapods.org/pods/MGXRouter)
[![License](https://img.shields.io/cocoapods/l/MGXRouter.svg?style=flat)](https://cocoapods.org/pods/MGXRouter)
[![Platform](https://img.shields.io/cocoapods/p/MGXRouter.svg?style=flat)](https://cocoapods.org/pods/MGXRouter)

## Description
基本思路参考[CTMediator](https://github.com/casatwy/CTMediator). 结合实际项目开发, 在其基础上进行了功能完善.

目前支持动态调用的范围:

    1. 类方法
    2. 对象方法
    3. 单例

## Usage  

### 参数传递说明

同时支持两种参数传递形式, 若同时使用两种方式, 则会进行参数合并. 

 1. URL Query方式用于传递NSString类型参数
 2. NSDictionary支持非常规参数, 如图片,自定义对象等

### 调用类方法

```
    //不带参数
    [MGXRouter openURL:@"Router://MGXTest/testClassMethod" params:nil];
    //带参数
    [MGXRouter openURL:@"Router://MGXTest/testClassMethod"
```  
 
### 调用对象方法

```
	//不带参数
    [MGXRouter openURL:@"Router://MGXTest/testObjectMethod" params:nil];
    //带参数
    [MGXRouter openURL:@"Router://MGXTest/testObjectMethod?name=jobs&age=14" params:nil];
```

### 调用单例

```
    //带参数
    [MGXRouter openURL:@"Router://MGXTest/sharedInstance/testObjectMethod?age=13" params:@{}];
    //不带参数
    [MGXRouter openURL:@"Router://MGXTest/sharedInstance/testObjectMethod" params:nil];
```

更多信息参考Example工程.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

MGXRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MGXRouter'
```

## Author

mangox: [www.devzhang.cn](www.devzhang.cn)

## License

MGXRouter is available under the MIT license. See the LICENSE file for more info.
