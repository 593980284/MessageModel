//
//  MessageManager.h
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
///用与处理接口返回登录失败，跳转登录界面，成功刷新失败接口

#import <Foundation/Foundation.h>
#import "MessageModel.h"
@interface HCMessageManager : NSObject

+ (instancetype)share;

/**
 在接口返回用户信息失效的时候调用，将messageModel保存起来
 */
- (void)addMessage:(MessageModel *)messageModel;
/**
 登录成功的时候调用
 */
- (void)sendAllMsg;
/**
 在登录界面dealloc中调用
 */
- (void)removeAll;
@end
