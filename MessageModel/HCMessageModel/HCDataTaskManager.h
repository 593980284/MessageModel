//
//  HCDataTaskManager.h
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
/// 对于处理当界面销毁的时候，将销毁页面里面的所有所有网络请求终止

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCDataTaskManager : NSObject

+ (instancetype)share;


/**
 保存NSURLSessionDataTask，一般在自己封装的网络请求里面调用
 @param dataTask NSURLSessionDataTask
 @param Identifier 唯一标示 自己根据请求连接和参数生产唯一标示
 @param object 请求在那个对象发起的
 */
- (void)saveDataTask:(NSURLSessionDataTask *)dataTask
          identifier:(NSString *)Identifier
              object:(id)object;

/**
 请在对象dealloc方法中调用这个方法。移除该对象的所有网络请求
 @param object 如果对象类型是并非UIViewController、UIView及子类，需要自己调用
 */
- (void)cancelDataTaskWithObject:(id)object;

@end


/**
 交换dealloc方法，在销毁后调用  【HCDataTaskManager cancelDataTaskWithObject：】
 */
@interface UIViewController (HCDataTaskManager)

@end

/**
 交换dealloc方法，在销毁后调用  【HCDataTaskManager cancelDataTaskWithObject：】
 */
@interface UIView (HCDataTaskManager)

@end
