//
//  HCNetLoadingViewManager.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "HCNetLoadingViewManager.h"
#import "MessageModel.h"
//#import "AppDelegate.h"
@class AppDelegate;
static HCNetLoadingViewManager * _manager = nil;
@interface HCNetLoadingViewManager ()
@property(nonatomic, strong)NSMutableArray<MessageModel *> *queue;
@property(nonatomic, assign)NSInteger tag;
@end

@implementation HCNetLoadingViewManager
+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc]init];
    });
    return _manager;
}

- (instancetype)init{
    if ([super init]) {
        _queue = [NSMutableArray new];
        _tag = 1000;
    }
    return self;
}

- (NSInteger)queueLoadingWithMsg:(NSString *)msg
{
    MessageModel *showLoadingMessageModel = [[MessageModel alloc]initWithTarget:self sel:@selector(creatLoadingViewWithMsg:tag:),msg ,_tag];
    showLoadingMessageModel.tag = _tag;
    [_queue addObject:showLoadingMessageModel];
    if (_queue.count == 1) {
        [showLoadingMessageModel msgSend];
    }
    _tag ++;
    return _tag - 1;
}


- (void)closeLoadingWithTag:(NSInteger )tag
{
    if (_queue.count) {
       // NSLog(@"%ld",_queue[0].tag);
        if (_queue[0].tag == tag) {
            [self closeLoadingViewWithTag:tag];
            [_queue removeObjectAtIndex:0];
            [_queue.firstObject msgSend];
        }else{
            NSMutableArray *temp = [_queue mutableCopy];
            for (MessageModel *model in temp) {
                if (model.tag == tag) {
                    [_queue removeObject:model];
                    break;
                }
            }
        }
    }
}


///根据tag生成loadingView，添加的window
- (void)creatLoadingViewWithMsg:(NSString *)msg tag:(NSInteger) tag
{
    UIView *window = self.myWindow;

    UIView *loadingView = [UIView new];
    loadingView.tag = tag;
    loadingView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    loadingView.frame = window.bounds;

    UILabel *titleLb = [UILabel new];
    titleLb.text = msg;
    [loadingView addSubview:titleLb];
    [titleLb sizeToFit];
    titleLb.center = window.center;

    [window addSubview:loadingView];
}

///根据tag，在window中移除LoadingView
- (void)closeLoadingViewWithTag:(NSInteger)tag{
    UIView *window = self.myWindow;
    UIView *loadingView = [window viewWithTag:tag];
    if (loadingView) {
        [loadingView removeFromSuperview];
    }
}
@end
