//
//  NSObject+HCCategory.m
//  联系人
//
//  Created by 胡超 on 2018/7/17.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "NSObject+HCCategory.h"
#import "UIViewController+HCCategory.h"
#import "AppDelegate.h"
@implementation NSObject (HCCategory)

/**
 获取当前控制器
 */
-(UIViewController *)getCurrentVC{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return [appDelegate.window.rootViewController gk_visibleViewControllerIfExist];
}
@end
