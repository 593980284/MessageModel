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
#import "AFNetworking.h"

#define kTimeOutInterval 10

@implementation NetWorkTool
+(AFHTTPSessionManager *)manager{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager=[AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
        
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        
        manager.requestSerializer.timeoutInterval = kTimeOutInterval;
        
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        
    });
    
    return manager;
    
}



+ (void)GETWithURL:(NSString *)url
            params:(NSDictionary *)parmas
        messageModel:(MessageModel *)messageModel
           success:(SuccessBlock)successBlock
           failure:(AFErrorBlock)errorBlock
       showLoading:(BOOL)showLoading
{
    HCNetLoadingViewManager *netLoadingViewManager = [HCNetLoadingViewManager share];
    NSInteger tag = 0;
    if (showLoading) {
          tag = [netLoadingViewManager queueLoadingWithMsg:@"正在加载中..."];
    }
    
    NSURLSessionDataTask * task = [[NetWorkTool manager] GET:url parameters:parmas headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (showLoading) {
            [netLoadingViewManager closeLoadingWithTag:tag];
        }
        NSInteger code = [responseObject[@"code"] integerValue];
        switch (code) {
            case 200:
            { ///成功就返回结果
               successBlock(responseObject[@"result"]);
                break;
            }
            case 201:
            { ///用户信息失效
                [[HCMessageManager share] addMessage:messageModel];
                if([[self getCurrentVC] isMemberOfClass:[LoginViewController class]] == NO){
                    
                    LoginViewController *vc = [LoginViewController new];
                    [[self getCurrentVC] presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
                }
                break;
            }
                
            default:///其他情况返回error
                errorBlock(nil);
                break;
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (showLoading) {
            [netLoadingViewManager closeLoadingWithTag:tag];
        }
        errorBlock(error);
    }];
    
    [[HCDataTaskManager share] saveDataTask:task identifier:@"" object:messageModel.target];
}

+ (void)POSTWithURL:(NSString *)url
             params:(NSDictionary *)parmas
          messageModel:(MessageModel *)messageModel
            success:(SuccessBlock)successBlock
            failure:(AFErrorBlock)errorBlock
        showLoading:(BOOL)showLoading
{
    
}
@end
