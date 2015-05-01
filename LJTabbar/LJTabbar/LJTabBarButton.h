//
//  LJTabBarButton.h
//  LJTabbar
//
//  Created by 梁建 on 15/5/1.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define LJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 图标的比例
#define LJTabBarButtonImageRatio 0.6

// 按钮的默认文字颜色
#define  LJTabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  LJTabBarButtonTitleSelectedColor (iOS7 ? LJColor(234, 103, 7) : LJColor(248, 139, 0))


#import <UIKit/UIKit.h>

@interface LJTabBarButton : UIButton
@property (nonatomic, strong) UITabBarItem *item;
@end
