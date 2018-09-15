//
//  UIViewController+GKCategory.h
//  GKCustomNavigationBar
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
//  使用运行时为UIViewController添加分类

#import <UIKit/UIKit.h>


@interface UIViewController (HCCategory)
/**
 返回显示的控制器
 */
- (UIViewController *)gk_visibleViewControllerIfExist;

@end
