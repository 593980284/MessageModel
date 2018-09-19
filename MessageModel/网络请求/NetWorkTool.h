//
//  NetWorkTool.h
//  MessageModel
//
//  Created by 胡超 on 2018/9/15.
//  Copyright © 2018年 胡超. All rights reserved.
///  模拟网络请求

#import <Foundation/Foundation.h>
#import "HCMessageModel.h"
typedef void (^SuccessBlock)(NSDictionary *result);
typedef void (^AFErrorBlock)(NSError *error);
@interface NetWorkTool : NSObject

+ (void)GETWithURL:(NSString *)url
            params:(NSDictionary *)parmas
         messageModel:(MessageModel *)messageModel
           success:(SuccessBlock)successBlock
           failure:(AFErrorBlock)errorBlock
       showLoading:(BOOL)showLoading;

+ (void)POSTWithURL:(NSString *)url
             params:(NSDictionary *)parmas
          messageModel:(MessageModel *)messageModel
            success:(SuccessBlock)successBlock
            failure:(AFErrorBlock)errorBlock
        showLoading:(BOOL)showLoading;
@end
