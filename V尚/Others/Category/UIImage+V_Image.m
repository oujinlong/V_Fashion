//
//  UIImage+V_Image.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "UIImage+V_Image.h"

@implementation UIImage (V_Image)
+(UIImage *)imageWithColor:(UIColor *)color{
    CGSize imageSize = CGSizeMake(300, 300);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}


@end
