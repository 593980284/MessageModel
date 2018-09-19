//
//  LoginViewController.m
//  MessageModel
//
//  Created by 胡超 on 2018/9/15.
//  Copyright © 2018年 胡超. All rights reserved.
//

#import "LoginViewController.h"
#import "HCMessageManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    UILabel *lb = [UILabel new];
    lb.bounds = CGRectMake(0, 0, 100, 100);
    lb.text = @"登录";
    lb.center = self.view.center;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lb];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"登录成功");
    [self dismissViewControllerAnimated:YES completion:nil];
    [[HCMessageManager share] sendAllMsg];
}

- (void)dealloc
{
     NSLog(@"%p",self);
    [[HCMessageManager share] removeAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
