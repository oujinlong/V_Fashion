//
//  V_Define.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LOG_FUNC NSLog(@"%s",__func__)

/**** 颜色*****/
#define COLOR(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define COLOR_BLACK_COLOR [UIColor blackColor]
#define COLOR_LIGHTGRAY_COLOR [UIColor lightGrayColor]
#define COLOR_RED_COLOR [UIColor redColor]
#define COLOR_GRAY_COLOR [UIColor grayColor]
#define COLOR_CLEAR_COLOR [UIColor clearColor]
#define COLOR_WHITE_COLOR [UIColor whiteColor]
/**** 字体*****/

#define FONT(font) [UIFont systemFontOfSize:font]
#define FONT_BODER(font) [UIFont boldSystemFontOfSize:font]


@interface V_Define : NSObject

@end
