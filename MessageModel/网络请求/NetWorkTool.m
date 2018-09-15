//
//  NetWorkTool.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/15.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "NetWorkTool.h"
#import "NSObject+HCCategory.h"
#import "LoginViewController.h"
@implementation NetWorkTool
+ (void)POSTWithURL:(NSString *)url
             params:(NSDictionary *)dic
       messageModel:(MessageModel *)messageModel{
    
    if([url isEqualToString:@"需要用户登录请求接口"]){
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"] != YES) {
            LoginViewController *vc = [LoginViewController new];
            vc.messageModel = messageModel;
            [[self getCurrentVC] presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
        }
    
    }
}
@end
