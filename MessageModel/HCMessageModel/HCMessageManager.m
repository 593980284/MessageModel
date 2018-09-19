//
//  MessageManager.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "HCMessageManager.h"
@interface HCMessageManager()
@property(nonatomic, strong)NSMutableArray* messages;
@end
static HCMessageManager * _manager = nil;
@implementation HCMessageManager
+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc]init];
    });
    return _manager;
}
- (NSMutableArray *)messages
{
    if (!_messages) {
        _messages = [NSMutableArray new];
    }
    return _messages;
}

- (void)addMessage:(MessageModel *)messageModel
{
    [self.messages addObject:messageModel];
}

- (void)sendAllMsg
{
    for (MessageModel *model in self.messages) {
        [model msgSend];
    }
    [self.messages removeAllObjects];
}

- (void)removeAll{
    [self.messages removeAllObjects];
}

@end
