//
//  NetWorkTool.h
//  MessageModel
//
//  Created by 胡超 on 2018/9/15.
//  Copyright © 2018年 胡超. All rights reserved.
///  模拟网络请求

#import <Foundation/Foundation.h>
#import "MessageModel.h"
@interface NetWorkTool : NSObject
+ (void)POSTWithURL:(NSString *)url
             params:(NSDictionary *)dic
       messageModel:(MessageModel *)messageModel;
@end
