//
//  ChaseFishTabbarController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/16.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ChaseFishTabbarController.h"
#import "ChaseFishNavigationController.h"
#import "MessageViewController.h"
#import "AddressBookViewController.h"
#import "LiveStreamingViewController.h"
#import "ResourceViewController.h"
#import "MineViewController.h"
@interface ChaseFishTabbarController ()

@end

@implementation ChaseFishTabbarController
+(void)initialize
{
    UITabBar *tabBar = [UITabBar appearance];
    //设置tabbar的主色调为白色
    tabBar.barTintColor = [UIColor whiteColor];
    UITabBarItem *tabbarItem = [UITabBarItem appearance];
    //设置被选中时的字体颜色
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加消息页面
    MessageViewController *messageVC = [MessageViewController new];
    [self addChildViewController:messageVC andTitle:@"消息" andImageName:@"" andSelectedImage:@""];
    //添加通讯录页面
    AddressBookViewController *addressBookVC = [AddressBookViewController new];
    [self addChildViewController:addressBookVC andTitle:@"通讯录" andImageName:@"" andSelectedImage:@""];
    //添加直播页面
    LiveStreamingViewController *liveStreamingVC = [LiveStreamingViewController new];
    [self addChildViewController:liveStreamingVC andTitle:@"直播" andImageName:@"" andSelectedImage:@""];
    //添加资源页面
    ResourceViewController *resourceVC = [ResourceViewController new];
    [self addChildViewController:resourceVC andTitle:@"资源" andImageName:@"" andSelectedImage:@""];
    //添加我的页面
    MineViewController *mineVC = [MineViewController new];
    [self addChildViewController:mineVC andTitle:@"我的" andImageName:@"" andSelectedImage:@""];
    
    // Do any additional setup after loading the view.
}
//添加自控制器，设置标题，图片，和被选图片
-(void)addChildViewController:(UIViewController *)childViewController andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectedImage:(NSString *)selectedImageName{
    
    childViewController.title = title;
    
    childViewController.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ChaseFishNavigationController *nav = [[ChaseFishNavigationController alloc]initWithRootViewController:childViewController];
    
    [self addChildViewController:nav];
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
