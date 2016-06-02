//
//  V_Style.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_Style.h"
#import "V_Define.h"
@implementation V_Style
+(instancetype)currentStyle{
    static dispatch_once_t pre;
    static V_Style* instanceStyle = nil;
    dispatch_once(&pre, ^{
        instanceStyle = [[V_Style alloc] init];
    });
    
    return instanceStyle;
}

- (UIColor *)themePink
{
    return  COLOR(241, 88, 109);
}

@end
