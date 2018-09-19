//
//  UIViewController+GKCategory.m
//  GKCustomNavigationBar
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UIViewController+HCCategory.h"



@implementation UIViewController (HCCategory)

- (UIViewController *)gk_visibleViewControllerIfExist {
    //NSLog(@"--%@",self);
    if (self.presentedViewController) {
        return [self.presentedViewController gk_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UINavigationController class]]) {
        return [((UINavigationController *)self).topViewController gk_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        return [((UITabBarController *)self).selectedViewController gk_visibleViewControllerIfExist];
    }
    
    return self;
    
//    if ([self isViewLoaded] && self.view.window) {
//        return self;
//    }else {
//        NSLog(@"找不到可见的控制器，viewcontroller.self = %@, self.view.window = %@", self, self.view.window);
//        return nil;
//    }
}

@end
