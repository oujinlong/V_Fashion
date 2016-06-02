//
//  V_ShareView.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_ShareView.h"
#import "OUVerticalButton.h"

@interface V_ShareView ()
@property (nonatomic, strong) UILabel* shareLB;
@property (nonatomic, strong) OUVerticalButton* qqButton;
@property (nonatomic, strong) OUVerticalButton* weChatButton;
@property (nonatomic, strong) OUVerticalButton* sinaButton;

@end
@implementation V_ShareView
- (UILabel *)shareLB
{
    if (!_shareLB) {
        UILabel* label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = COLOR_GRAY_COLOR;
        label.font = FONT(13);
        label.text = @"社交帐号一键登录";
        
        
        
        _shareLB = label;
    }
    return _shareLB;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupMain];
    }
    return self;
}

- (OUVerticalButton *)weChatButton
{
    if (!_weChatButton) {
        _weChatButton = [OUVerticalButton buttonWithImage:@"UMS_wechat_icon" highlightImage:nil title:@"微信" font:FONT(12.5)];
        [_weChatButton setTitleColor:COLOR_GRAY_COLOR forState:UIControlStateNormal];
        
    }
    return _weChatButton;
}
-(OUVerticalButton *)qqButton{
    if (!_qqButton) {
        _qqButton = [OUVerticalButton buttonWithImage:@"UMS_qq_icon" highlightImage:nil title:@"QQ" font:FONT(12.5)];
        [_qqButton setTitleColor:COLOR_GRAY_COLOR forState:UIControlStateNormal];
        
    }
    return _qqButton;
}

- (OUVerticalButton *)sinaButton
{
    if (!_sinaButton) {
        _sinaButton = [OUVerticalButton buttonWithImage:@"UMS_sina_icon" highlightImage:nil title:@"微博" font:FONT(12.5)];
        [_sinaButton setTitleColor:COLOR_GRAY_COLOR forState:UIControlStateNormal];
        
    }
    return _sinaButton;

}

-(void)setupMain{
    
    [self addSubview:self.shareLB];
    [self.shareLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    
    UIView* lineLeft = [[UIView alloc] init];
    lineLeft.backgroundColor = [COLOR_LIGHTGRAY_COLOR colorWithAlphaComponent:0.7];
    [self addSubview:lineLeft];
    [lineLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.shareLB.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.shareLB);
        make.size.mas_equalTo(CGSizeMake(70, 0.5));
    }];
    
    UIView* lineRight = [[UIView alloc] init];
    lineRight.backgroundColor = [COLOR_LIGHTGRAY_COLOR colorWithAlphaComponent:0.7];
    [self addSubview:lineRight];
    [lineRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shareLB.mas_right).offset(10);
        make.centerY.mas_equalTo(self.shareLB);
        make.size.mas_equalTo(CGSizeMake(70, 0.5));
    }];

    [self addSubview:self.qqButton];
    [self.qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.shareLB.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 80));
    }];
    
    [self addSubview:self.weChatButton];
    [self.weChatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.qqButton.mas_left).mas_equalTo(-50);
        make.top.mas_equalTo(self.qqButton);
        make.size.mas_equalTo(self.qqButton);
    }];
    
    [self addSubview:self.sinaButton];
    [self.sinaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.qqButton.mas_right).mas_equalTo(50);
        make.top.mas_equalTo(self.qqButton);
        make.size.mas_equalTo(self.qqButton);
    }];

}

@end
