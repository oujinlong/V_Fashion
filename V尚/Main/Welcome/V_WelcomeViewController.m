//
//  V_WelcomeViewController.m
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_WelcomeViewController.h"
#import "V_LoginRegistViewController.h"

@interface V_WelcomeViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) NSTimer* timer;
//@property (nonatomic, strong) UIImageView* iconImageView;
@property (nonatomic, assign) CGPoint iconStartPoint;
@end

@implementation V_WelcomeViewController


- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height * 0.8);
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * 3, _scrollView.bounds.size.height);
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = COLOR_CLEAR_COLOR;
        _scrollView.delegate = self;
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame) - 30, self.view.bounds.size.width, 30)];
        self.pageControl.numberOfPages = 3;
        self.pageControl.pageIndicatorTintColor = COLOR_LIGHTGRAY_COLOR;
        self.pageControl.currentPageIndicatorTintColor = [COLOR_RED_COLOR colorWithAlphaComponent:0.7];
        
    }
    return _scrollView;
}
- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    }
    return _timer;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.timer fire];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}
- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        
        UIButton* regisetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [regisetButton setTitle:@"快速注册" forState:UIControlStateNormal];
        [regisetButton setTitleColor:COLOR_WHITE_COLOR forState:UIControlStateNormal];
        [regisetButton setBackgroundColor:[COLOR_RED_COLOR colorWithAlphaComponent:0.8]];
        regisetButton.titleLabel.font = FONT(16);
        [_bottomView addSubview:regisetButton];
        [regisetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(80);
            make.right.mas_equalTo(-80);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(40);
        }];
        [regisetButton addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loginButton.titleLabel.font = FONT(14);
        [_bottomView addSubview:loginButton];
        [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(regisetButton.mas_bottom).offset(8);
        }];
        [loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        
        NSString* text = @"点击登录，进入V尚";
        NSMutableAttributedString* title = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName : FONT(14), NSForegroundColorAttributeName : COLOR_BLACK_COLOR}];
      NSRange range =  [text rangeOfString:@"登录"];
        [title addAttributes:@{NSForegroundColorAttributeName : [COLOR_RED_COLOR colorWithAlphaComponent:0.8] ,NSFontAttributeName : FONT(14)} range:range];
        [loginButton setAttributedTitle:title forState:UIControlStateNormal];
    }
    return _bottomView;
}

//- (UIImageView *)iconImageView
//{
//    if (!_iconImageView) {
//        UIImageView *imageView = [[UIImageView alloc]init];
//        imageView.image = [UIImage imageNamed:@"UMS_wechat_icon"];
//        imageView.contentMode = UIViewContentModeScaleAspectFill;
//        
//        _iconImageView = imageView;
//    }
//    return _iconImageView;
//}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMain];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)setupMain {
    
    UIImageView* bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"walkthroughs_44_bg.jpg"]];
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self setupScrollView];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.scrollView.mas_bottom);
    }];
    
//    [self.view addSubview:self.iconImageView];
//    self.iconImageView.frame = CGRectMake(0, 0, 45, 45);
//    self.iconImageView.center = self.iconStartPoint;
}

-(void)setupScrollView{
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];

    NSArray* titleArray = @[@"发 现 全 世 界 的 好 生 活",@"和 最 会 生 活 的 人 做 朋 友",@"找 全 世 界 最 好 的 东 西"];
    NSArray* imageArray = @[@"welcome2.jpg",@"welcome1.jpg",@"welcome3.jpg"];
    for (NSInteger i = 0 ; i < titleArray.count; i ++) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake( i * self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, 30)];
        label.font = FONT_BODER(self.view.bounds.size.width <= 320 ? 14 : 16);
        label.textColor = COLOR_BLACK_COLOR;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        [self.scrollView addSubview:label];
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageArray[i]]];
        CGFloat margin = self.view.bounds.size.width <= 320 ? 80 : 60;
        CGFloat imageWidth =  self.view.bounds.size.width - 2 * margin ;
        CGFloat imageHeight = imageWidth * 1.7;
        imageView.frame = CGRectMake(0, CGRectGetMaxY(label.frame) + 30, imageWidth, imageHeight);
        imageView.center = CGPointMake(self.scrollView.bounds.size.width /2 + (i * _scrollView.bounds.size.width), imageView.center.y);
        imageView.layer.shadowRadius = 5;
        imageView.layer.shadowColor = [COLOR_BLACK_COLOR colorWithAlphaComponent:0.5].CGColor;
        imageView.layer.shadowOpacity = 20;
        if (i ==0) {
            self.iconStartPoint = CGPointMake(imageView.frame.origin.x, imageView.frame.origin.y + 20);
        }
        [self.scrollView addSubview:imageView];
    }
    
}
#pragma mark button action
-(void)timerHandle{
    LOG_FUNC;
    NSInteger index = self.pageControl.currentPage;
    if (index != self.scrollView.contentSize.width / self.scrollView.bounds.size.width - 1) {
        index ++;
    }else{
        index = 0;
    }
    
    CGPoint point = CGPointMake(index * self.scrollView.bounds.size.width, 0);
    
    [self.scrollView setContentOffset:point animated:YES];
}
-(void)loginClick{
    V_LoginRegistViewController* loginVc = [[V_LoginRegistViewController alloc] initWithType:V_LoginRegistViewControllerTypeLogin];
    [self.navigationController pushViewController:loginVc animated:YES];
}

-(void)registClick{
    V_LoginRegistViewController* registVc = [[V_LoginRegistViewController alloc] initWithType:V_LoginRegistViewControllerTypeRegist];
    [self.navigationController pushViewController:registVc animated:YES];
}
#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    self.pageControl.currentPage = index;
    
    
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
