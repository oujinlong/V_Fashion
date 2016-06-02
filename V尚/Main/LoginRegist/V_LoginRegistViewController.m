//
//  V_LoginViewController.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_LoginRegistViewController.h"
#import "V_LoginView.h"
#import "V_ShareView.h"
#import "AppDelegate.h"
@interface V_LoginRegistViewController () <V_LoginViewDelegate>
@property (nonatomic, assign) V_LoginRegistViewControllerType type;
@property (nonatomic, weak) V_LoginView* loginView;
@end

@implementation V_LoginRegistViewController
-(instancetype)initWithType:(V_LoginRegistViewControllerType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.loginView becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMain];
}

- (void)setupMain {
    UIImageView* bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"walkthroughs_44_bg.jpg"]];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
   
    
    UILabel* loginLB = [[UILabel alloc] init];
    loginLB.font = FONT_BODER(16);
    loginLB.textColor = COLOR_BLACK_COLOR;
    [self.view addSubview:loginLB];
    [loginLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(30);
    }];
    loginLB.text = self.type == V_LoginRegistViewControllerTypeLogin ? @"登录" : @"注册";
    
    
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"ysl_navi_back_btn"] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(loginLB);
        make.left.mas_equalTo(15);
    }];
    [backButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    V_LoginView* loginView = [[V_LoginView alloc] initWithIsLogin:self.type == V_LoginRegistViewControllerTypeLogin];
    self.loginView = loginView;
    self.loginView.delegate = self;
    [self.view addSubview:loginView];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(loginLB.mas_bottom).offset(60);
        make.height.mas_equalTo(130);
    }];
    
    
    V_ShareView* shareView = [[V_ShareView alloc] init];
    [self.view addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(loginView.mas_bottom).offset(50);
        make.height.mas_equalTo(100);
    }];
}

#pragma mark button action
-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark V_LoginViewDelegate
-(void)V_LoginViewDidClickRegist:(V_LoginView *)V_LoginView{
    [self.navigationController pushViewController:[[V_LoginRegistViewController alloc] initWithType:V_LoginRegistViewControllerTypeRegist] animated:YES];
}

-(void)V_LoginView:(V_LoginView *)V_LoginView didFinishLoginWithUserName:(NSString *)userName{
    NSLog(@"登录");
    
    [self showLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideLoading];
        AppDelegate* de = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [de enterHome];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
