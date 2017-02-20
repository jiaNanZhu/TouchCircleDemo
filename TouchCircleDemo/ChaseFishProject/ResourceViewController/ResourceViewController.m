//
//  ResourceViewController.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/16.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ResourceViewController.h"
#import "RotationBtnModel.h"
#import "CFRotationView.h"
#import "ChaseFishStoreViewController.h"
@interface ResourceViewController ()
@property (nonatomic , strong) UIButton *button;
@property (nonatomic , strong) CFRotationView *romate;
@property (nonatomic , strong) NSMutableArray *datasource;

@end

@implementation ResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //屏幕圆盘中心
    CGPoint center = CGPointMake(ScreenWidth/2, ScreenHeight/2-64);
    

    //设置控制器View的背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-44)];
    backgroundImageView.image = [UIImage imageNamed:@"zybg"];
    [self.view addSubview:backgroundImageView];
    // 自定义的转盘视图
    CFRotationView *romate = [[CFRotationView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-10, ScreenWidth-10)];
    romate.center = center;
    self.romate = romate;
    romate.layer.contents = (__bridge id)[UIImage imageNamed:@"round"].CGImage;
    
    // 获取按钮模型数据
    _datasource = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"ButtonList.plist" ofType:nil];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *item  in contentArray) {
        RotationBtnModel *model = [[RotationBtnModel alloc]init];
        [model setValuesForKeysWithDictionary:item];
        [_datasource addObject:model];
    }
    NSMutableArray *titleArray = [NSMutableArray new];
    NSMutableArray *imageArray = [NSMutableArray new];
    for (RotationBtnModel *model  in _datasource) {
        
        [titleArray addObject:model.title];
        [imageArray addObject:model.image];
        
    }
    
    [romate BtnType:CF_RoundViewTypeCustom BtnWidth:80 adjustsFontSizesTowidth:YES masksToBounds:YES conrenrRadius:40 image:imageArray TitileArray:titleArray titileColor:[UIColor blackColor]];
    
#pragma mark - 使用block逆向传值，用途为点击旋转view上的按钮时弹出控制器
    __weak  typeof(self) weakself = self;
    romate.back = ^(NSInteger num ,NSString *name ) {
        [weakself pushView:num name:name];
    };
    [self.view addSubview:romate];
    //左侧三角形图片
    UIImageView *leftImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, center.y-ScreenWidth*tanf(M_PI/8)/2, ScreenWidth/2, ScreenWidth*tanf(M_PI/8))];
    leftImageV.image = [UIImage imageNamed:@"sj"];
    //    leftImageV.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftImageV];

    
    // 自定义的中间按钮
    UIView *centerBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    centerBgView.backgroundColor = RGBColor(255, 255, 255, 0.25);
    centerBgView.layer.cornerRadius = 40;
    centerBgView.layer.masksToBounds = YES;
    centerBgView.center = center;
    [self.view addSubview:centerBgView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
//    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = [UIImage imageNamed:@"logo"];
    imageView.center = center;
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view from its nib.
}
//点击中间按钮执行的方法

// 跳转界面
- (void)pushView:(NSInteger)num name:(NSString *)name {
    
    NSMutableArray *classArray = [NSMutableArray new];
    
    for (RotationBtnModel *model  in _datasource) {
        
        [classArray addObject:model.className];
    }
    Class class = NSClassFromString(classArray[num]);
    
    ChaseFishStoreViewController *vc = [[class alloc]init];
    vc.title = name;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];
    self.hidesBottomBarWhenPushed = NO;
    
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
