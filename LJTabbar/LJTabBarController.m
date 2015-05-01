//
//  LJTabBarController.m
//  LJTabbar
//
//  Created by 梁建 on 15/5/1.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "LJTabBarController.h"
#import "LJTabbar.h"
#import "UIImage+LJ.h"
@interface LJTabBarController () <LJTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) LJTabbar *customTabBar;


@end


@implementation LJTabBarController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTabbar];
    [self setupVc];
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setupTabbar
{
    LJTabbar *customTabBar=[[LJTabbar alloc]init];
    customTabBar.frame=self.tabBar.bounds;
    customTabBar.delegate=self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar=customTabBar;
    
    
}


-(void)setupVc
{
    
    
    UIViewController *home = [[UIViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    //self.home = home;
    home.tabBarItem.badgeValue=@"100";
    // 2.消息
    UIViewController *message = [[UIViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    message.tabBarItem.badgeValue=@"1000";
    
    // 3.广场
    UIViewController *discover = [[UIViewController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
   
    discover.tabBarItem.badgeValue=@"10";
    // 4.我
    UIViewController *me = [[UIViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    me.tabBarItem.badgeValue=@"9";
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

#pragma mark - tabbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(LJTabbar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
    
   
}


@end
