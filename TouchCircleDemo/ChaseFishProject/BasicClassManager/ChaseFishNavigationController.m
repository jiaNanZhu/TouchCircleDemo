//
//  ChaseFishNavigationController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/16.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ChaseFishNavigationController.h"

@interface ChaseFishNavigationController ()

@end

@implementation ChaseFishNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置导航栏的背景色
    bar.barTintColor = RGBColor(45, 59, 73, 1);
    
    bar.translucent = NO;
    
    //设置导航栏标题的字体颜色和大小
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // Do any additional setup after loading the view.
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
