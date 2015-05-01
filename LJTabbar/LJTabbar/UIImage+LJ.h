//
//  UIImage+LJ.h
//  LJTabbar
//
//  Created by 梁建 on 15/5/1.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface UIImage (LJ)

/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
