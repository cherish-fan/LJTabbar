//
//  LJTabbar.m
//  LJTabbar
//
//  Created by 梁建 on 15/5/1.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "LJTabbar.h"
#import "LJTabBarButton.h"
#import "UIImage+LJ.h"
@interface LJTabbar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@property (nonatomic, weak) LJTabBarButton *selectedButton;
@end

@implementation LJTabbar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        
        // 添加一个加号按钮
       
    }
    return self;
}

- (void)plusButtonClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    LJTabBarButton *button = [[LJTabBarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(LJTabBarButton *)button
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    // 按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        LJTabBarButton *button = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
//        if (index > 1) {
//            buttonX += buttonW;
//        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}



@end
