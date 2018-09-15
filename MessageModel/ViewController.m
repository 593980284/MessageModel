//
//  ViewController.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/15.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "NetWorkTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb = [UILabel new];
    lb.bounds = CGRectMake(0, 0, 100, 400);
    lb.text = @"点击进行请求";
    lb.center = self.view.center;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lb];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self getNetDataNeedUserInfo:@"getNetDataNeedUserInfo"];
    [self getNetData:@"getNetData"];
}


-(void)getNetDataNeedUserInfo:(NSString*) str{
    [NetWorkTool POSTWithURL:@"需要用户登录请求接口" params:@{} messageModel:MessageModelWithArgs(,str)];
    NSLog(@"%@",str);
}


-(void)getNetData:(NSString*) str{
    [NetWorkTool POSTWithURL:@"不需要用户登录请求接口" params:@{} messageModel:MessageModelWithArgs(,str)];
    NSLog(@"%@",str);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
