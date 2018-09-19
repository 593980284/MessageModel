//
//  MessageModel.h
//  绘图
//
//  Created by 胡超 on 2018/9/14.
//  Copyright © 2018年 胡超. All rights reserved.
/// 把方法封装成一个对象

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
#define MessageModelWithArgs(...)   [[MessageModel alloc]initWithTarget:self sel:_cmd __VA_ARGS__]
@interface MessageModel : NSObject

- (instancetype)initWithTarget:(id) target
                           sel:(SEL) sel,...;

- (id)msgSend;

@property(nonatomic, weak, readonly)id target;

@end

@interface MessageModel (HCNetLoadingViewManager)

@property(nonatomic, assign)NSInteger tag;

@end
