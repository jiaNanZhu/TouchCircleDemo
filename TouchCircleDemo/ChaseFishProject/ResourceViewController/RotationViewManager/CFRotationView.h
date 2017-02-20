//
//  CFRotationView.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/17.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,CF_RoundViewType) {
    CF_RoundViewTypeSystem =0,
    CF_RoundViewTypeCustom,
};

typedef void (^jumpBlock)(NSInteger num ,NSString *name);
@interface CFRotationView : UIView
// 点击按钮时跳转控制器的逆向传值block
@property (nonatomic , copy) jumpBlock back ;
// 按钮样式，系统样式或者自定义样式
@property (nonatomic , assign)CF_RoundViewType type;
// 按钮宽度
@property (nonatomic , assign)CGFloat btnWidth;
// 视图的宽度
@property (nonatomic , assign)CGFloat width;
//按钮的背景颜色
@property (nonatomic , strong)UIColor *btnBackGroundColor;

/**
 *  创建按钮
 *
 *  @param type        按钮的风格
 *  @param BtnWidth    按钮的宽度
 *  @param sizeWidth    字体是否自动适应按钮的宽度
 *  @param mask        是否允许剪切
 *  @param radius      圆角的大小
 *  @param image       图片数组
 *  @param titileArray 名字数组
 *  @param titleColor  字体的颜色
 */


- (void)BtnType:(CF_RoundViewType)type BtnWidth:(CGFloat)BtnWidth  adjustsFontSizesTowidth:(BOOL)sizeWidth  masksToBounds:(BOOL)mask conrenrRadius:(CGFloat)radius image:(NSMutableArray *)image TitileArray:(NSMutableArray *)titileArray titileColor:(UIColor *)titleColor;

@end
