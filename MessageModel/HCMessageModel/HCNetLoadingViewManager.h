//
//  HCNetLoadingViewManager.h
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCNetLoadingViewManager : NSObject

+ (instancetype)share;

/**
 在发起网络的调用，显示加载框

 @param msg LoadingView的显示文字
 @return LoadingView的tag值
 */
- (NSInteger)queueLoadingWithMsg:(NSString *)msg;



/**
 在网络失败、成功的回调中调用这个方法，隐藏加载框

 @param tag LoadingView的tag值
 */
- (void)closeLoadingWithTag:(NSInteger )tag;


@property(nonatomic, strong)UIView *myWindow;

@end
