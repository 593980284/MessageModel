//
//  HCDataTaskManager.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/18.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "HCDataTaskManager.h"
#import <objc/runtime.h>
@interface HCDataTaskManager()
@property(nonatomic, strong)NSMutableDictionary<NSString *,NSMutableArray<NSURLSessionDataTask *> *> *table;
@end
static HCDataTaskManager * _manager = nil;
@implementation HCDataTaskManager

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc]init];
    });
    return _manager;
}

- (NSMutableDictionary *)table
{
    if (!_table) {
        _table = [NSMutableDictionary new];
    }
    return _table;
}

- (void)saveDataTask:(NSURLSessionDataTask *)dataTask
          identifier:(NSString *)Identifier
              object:(id)object
{
    if (!object) {
        return;
    }
    dataTask.taskDescription = Identifier;
    NSString *key = [NSString stringWithFormat:@"%p",object];
    NSMutableArray *dataTasks = _table[key];
    if (dataTasks) {
        dataTasks = [NSMutableArray new];
    }
    NSURLSessionDataTask *temp = nil;
    for (NSURLSessionDataTask * task in dataTasks) {
        if ([task.taskDescription isEqualToString:Identifier]) {
            if (task.state == NSURLSessionTaskStateRunning) {
                [task cancel];
                temp = task;
            }
        }
    }
    [dataTasks addObject:dataTask];
    if (temp) {
         [dataTasks removeObject:temp];
    }
    
    _table[key] = dataTasks;
}

- (void)cancelDataTaskWithObject:(id)object
{
    if (!object) {
        return;
    }
    NSString *key = [NSString stringWithFormat:@"%p",object];
    NSMutableArray *dataTasks = _table[key];
    if (dataTasks) {
        for (NSURLSessionDataTask * dataTask in dataTasks) {
            if ( dataTask.state == NSURLSessionTaskStateRunning) {
                [dataTask cancel];
            }
        }
    }
    [_table removeObjectForKey:key];
}

@end


@implementation UIViewController (HCDataTaskManager)

+ (void)load{
    
    
    
    Method m1 = class_getInstanceMethod([self class], NSSelectorFromString(@
                                                                           
                                                                           "dealloc"));
    
    Method m2 = class_getInstanceMethod([self class], @selector(xy_dealloc));
    
    
    
    method_exchangeImplementations(m1, m2);
    
}





- (void)xy_dealloc

{
    [[HCDataTaskManager share] cancelDataTaskWithObject:self];
    NSLog(@"%p",self);
    [self xy_dealloc];

}


@end

@implementation UIView (HCDataTaskManager)

+ (void)load{
    
    
    
    Method m1 = class_getInstanceMethod([self class], NSSelectorFromString(@
                                                                           
                                                                           "dealloc"));
    
    Method m2 = class_getInstanceMethod([self class], @selector(xy_dealloc));
    
    
    
    method_exchangeImplementations(m1, m2);
    
}





- (void)xy_dealloc

{
    [[HCDataTaskManager share] cancelDataTaskWithObject:self];
    [self xy_dealloc];
    
}


@end

