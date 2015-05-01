//
//  LJTabbar.h
//  LJTabbar
//
//  Created by 梁建 on 15/5/1.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJTabbar;

@protocol LJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LJTabbar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
- (void)tabBarDidClickedPlusButton:(LJTabbar *)tabBar;

@end


@interface LJTabbar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<LJTabBarDelegate> delegate;

@end
