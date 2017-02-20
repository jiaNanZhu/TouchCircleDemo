//
//  CFCustomRotationGestureRecognizer.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/2/17.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFCustomRotationGestureRecognizer : UIGestureRecognizer
// 记录手势最后一个改变时旋转的弧度
@property (nonatomic, assign) CGFloat rotation;
@end
