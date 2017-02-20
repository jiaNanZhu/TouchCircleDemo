//
//  CFRotationView.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/17.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "CFRotationView.h"
#import "CFCustomRotationGestureRecognizer.h"
@interface CFRotationView ()
// 按钮数组
@property (nonatomic , strong) NSMutableArray *btnArray;
// 旋转的弧度
@property (nonatomic , assign) CGFloat rotationAngleInRadians;
// 按钮的名字
@property (nonatomic , strong) NSMutableArray *nameArray ;

@end
@implementation CFRotationView

static CFRotationView *shareInstance;
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width / 2 ;
        self.width = self.frame.size.width;
        self.backgroundColor = [UIColor clearColor];
        // 按钮和按钮标题数组
        _btnArray = [NSMutableArray new];
        _nameArray = [NSMutableArray new];
        
        [self addGestureRecognizer:[[CFCustomRotationGestureRecognizer alloc]initWithTarget:self action:@selector(changeMove:)]];
    }
    return self;
}
- (void)BtnType:(CF_RoundViewType)type BtnWidth:(CGFloat)BtnWidth  adjustsFontSizesTowidth:(BOOL)sizeWith  masksToBounds:(BOOL)mask conrenrRadius:(CGFloat)radius image:(NSMutableArray *)image TitileArray:(NSMutableArray *)titileArray titileColor:(UIColor *)titleColor {
    CGFloat corner = -M_PI * 2.0 / titileArray.count;
    // 半径为 （转盘半径➖按钮半径）的一半
    CGFloat r = (self.width  - BtnWidth) / 2.2 ;
    CGFloat x = self.width  / 2 ;
    CGFloat y = self.width  / 2 ;
    _nameArray = titileArray;
    
    for (int i = 0 ; i < titileArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, BtnWidth, BtnWidth);
        btn.layer.masksToBounds = mask;
        btn.layer.cornerRadius = radius;
        CGFloat  num = (i + 0.5) * 1.0;
        //这里如果角度不加上M_PI/8的话，八个按钮的分布将是以Y轴为准，左右各四个平均分布
        btn.center = CGPointMake(x + r * cos(corner * num +M_PI/8), y + r *sin(corner * num+M_PI/8));
        
        self.btnWidth = BtnWidth;
        
        // 自定义按钮的样式
        if (type == CF_RoundViewTypeCustom){
            
            [btn setImage:[UIImage imageNamed:image[i]] forState:UIControlStateNormal];
            
            [btn setTitle:titileArray[i] forState:UIControlStateNormal];
            
            btn.imageEdgeInsets = UIEdgeInsetsMake(0,(btn.frame.size.width-btn.imageView.frame.size.width)/2,20, (btn.frame.size.width-btn.imageView.frame.size.width)/2);

            btn.titleEdgeInsets = UIEdgeInsetsMake(45,(-btn.imageView.frame.size.width-btn.titleLabel.frame.size.width)/2, 0, (btn.imageView.frame.size.width-btn.titleLabel.frame.size.width)/2);
            
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            
        }else{
            [btn setTitle:titileArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:titleColor forState:UIControlStateNormal];
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [_btnArray addObject:btn];
        
    }
}
#pragma mark - 点击按钮时跳转控制器
- (void)btn: (UIButton *)btn {
    
    NSInteger num1 = btn.tag;
    NSString *name = _nameArray[num1];
    self.back(num1,name);
    
}
#pragma mark -通过旋转手势转动转盘
- (void)changeMove:(CFCustomRotationGestureRecognizer *)retation {
    
    
    switch (retation.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            self.rotationAngleInRadians += retation.rotation;
            [UIView animateWithDuration:.25 animations:^{
                
                self.transform = CGAffineTransformMakeRotation(self.rotationAngleInRadians+retation.rotation);
                for (UIButton *btn in _btnArray) {
                    btn.transform = CGAffineTransformMakeRotation(-(self.rotationAngleInRadians+retation.rotation));
                }
            }];
            
            break;
        }
            
            //        case UIGestureRecognizerStateFailed:
            //        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            int num = self.rotationAngleInRadians/(M_PI/4);
            int last = ((int)(self.rotationAngleInRadians*(180/M_PI)))%(45);
            
            if (abs(last)>=22.5) {
                
                [UIView animateWithDuration:.25 animations:^{
                    
                    self.transform = CGAffineTransformMakeRotation(M_PI/4*(last>0?(num+1):(num-1)));
                    for (UIButton *btn in _btnArray) {
                        btn.transform = CGAffineTransformMakeRotation(-(M_PI/4*(last>0?(num+1):(num-1))));
                    }
                }];
                //偏转角度保存。
                self.rotationAngleInRadians = M_PI/4*(last>0?(num+1):(num-1));
                NSLog(@"偏转角度 = %lf ", self.rotationAngleInRadians*(180/M_PI));
                
            }
            else{
                
                [UIView animateWithDuration:.25 animations:^{
                    
                    self.transform = CGAffineTransformMakeRotation(M_PI/4*num);
                    for (UIButton *btn in _btnArray) {
                        btn.transform = CGAffineTransformMakeRotation(-(M_PI/4*num));
                    }
                }];
                //偏转角度保存。
                self.rotationAngleInRadians = M_PI/4*num;
                
            }
            
            break;
        }
        default:
            break;
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
