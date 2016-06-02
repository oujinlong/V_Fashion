//
//  OUVerticalButton.m
//  百思不得姐
//
//  Created by oujinlong on 16/5/8.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OUVerticalButton.h"

@implementation OUVerticalButton


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}




-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)
    ;
    
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.imageView.frame.size.width, self.frame.size.height - self.imageView.frame.size.width);
    
}


+(instancetype)buttonWithImage:(NSString *)image highlightImage:(NSString *)hilightImage title:(NSString *)title font:(UIFont *)font{
    
    OUVerticalButton* button = [OUVerticalButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hilightImage] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    return button;
}

@end
