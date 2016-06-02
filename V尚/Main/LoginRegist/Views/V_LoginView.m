//
//  V_LoginView.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_LoginView.h"

#import "UIImage+V_Image.h"
#import "OUInputValidate.h"
@interface V_LoginView () <UITextFieldDelegate>
@property (nonatomic, strong) UIView* inputView;
@property (nonatomic, weak) UITextField* textField;
@property (nonatomic, strong) UIButton* nextButton;
@property (nonatomic, strong) UIButton* registButton;
@property (nonatomic, strong) UIButton* passLoginButton;

@property (nonatomic, assign) BOOL isLogin;
@end
@implementation V_LoginView
-(instancetype)initWithIsLogin:(BOOL)isLogin{
    if (self = [super init]) {
        self.isLogin = isLogin;
        [self setupMain];
    }
    return self;
}
- (UIView *)inputView
{
    if (!_inputView) {
        _inputView = [UIView new];
        _inputView.layer.cornerRadius = 5;
        _inputView.layer.borderWidth = 0.5;
        _inputView.layer.borderColor = COLOR_LIGHTGRAY_COLOR.CGColor;
        
        
        UILabel* distrctLB = [[UILabel alloc] init];
        distrctLB.font = FONT(15);
        distrctLB.textColor = COLOR_BLACK_COLOR;
        distrctLB.textAlignment = NSTextAlignmentCenter;
        [_inputView addSubview:distrctLB];
        [distrctLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(50);
        }];
        distrctLB.text = @"+86";
        
        
        UIView* line = [[UIView alloc] init];
        line.backgroundColor = COLOR_LIGHTGRAY_COLOR;
        [_inputView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(distrctLB.mas_right);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(0.5);
        }];
        
        
        UITextField* textField = [[UITextField alloc] init];
        self.textField = textField;
        textField.font = distrctLB.font;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.tintColor = COLOR_BLACK_COLOR;
        textField.textColor = distrctLB.textColor;
        textField.placeholder = @"请输入您的手机号码";
        textField.delegate = self;
        [_inputView addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(line.mas_right).offset(10);
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-20);
        }];
        [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        
            }
    return _inputView;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageWithColor:[COLOR_RED_COLOR colorWithAlphaComponent:0.7]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:COLOR_LIGHTGRAY_COLOR] forState:UIControlStateDisabled];
        [button setTitle:self.isLogin ? @"下一步" : @"确定" forState:UIControlStateNormal];
        button.titleLabel.font = FONT(14);
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
        button.enabled = NO;
        _nextButton = button;
    }
    return _nextButton;
}

- (UIButton *)registButton
{
    if (!_registButton) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"快速注册" forState:UIControlStateNormal];
        [button setTitleColor:COLOR_GRAY_COLOR forState:UIControlStateNormal];
        [button addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
                
        _registButton = button;
    }
    return _registButton;
}

- (UIButton *)passLoginButton
{
    if (!_passLoginButton) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"使用密码登录" forState:UIControlStateNormal];
        [button setTitleColor:self.registButton.titleLabel.textColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(passLoginClick) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = self.registButton.titleLabel.font;
        
        
        
        _passLoginButton = button;
    }
    return _passLoginButton;
}




-(void)setupMain{
    
    [self addSubview:self.inputView];
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [self addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.inputView);
        make.top.mas_equalTo(self.inputView.mas_bottom).offset(20);
        make.height.mas_equalTo(35);
    }];
    
    if (self.isLogin) {
        [self addSubview:self.registButton];
        [self.registButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nextButton);
            make.top.mas_equalTo(self.nextButton.mas_bottom).offset(7);
        }];
        
        [self addSubview:self.passLoginButton];
        [self.passLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.nextButton);
            make.top.mas_equalTo(self.registButton);
        }];

    }
    
}
#pragma mark public action
-(void)becomeFirstResponder{
    [self.textField becomeFirstResponder];
}

#pragma mark button action
-(void)textFieldDidChange:(UITextField*)textField{
    if (textField == self.textField) {
        self.nextButton.enabled = [OUInputValidate validateMobile:textField.text];
        
    }
}
-(void)nextClick{
    LOG_FUNC;
    
    if (self.isLogin) {
        [self.delegate V_LoginView:self didFinishLoginWithUserName:self.textField.text];
    }
}

-(void)registClick{
    LOG_FUNC;
    [self.delegate V_LoginViewDidClickRegist:self];
}
-(void)passLoginClick{
    LOG_FUNC;
}
#pragma mark UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length == 0) return YES;
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    
    int max = 11;
    
  
    if (existedLength - selectedLength + replaceLength > max) {
        return NO;
    }
    
    return YES;

}
@end
