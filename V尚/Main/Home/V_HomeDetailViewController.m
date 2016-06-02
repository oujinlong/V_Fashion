//
//  V_HomeDetailViewController.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_HomeDetailViewController.h"
#import "YSLTransitionAnimator.h"
#import "UIViewController+YSLTransition.h"
#import "UIView+SDAutoLayout.h"
@interface V_HomeDetailViewController () <YSLTransitionAnimatorDataSource>
@property (nonatomic, strong) V_HomeModel* model;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGSize imageSize;
@end

@implementation V_HomeDetailViewController
-(instancetype)initWithHomeModel:(V_HomeModel *)model imageSize:(CGSize)imageSize{
    if (self = [super init]) {
        self.model = model;
//        self.imageSize = imageSize;
        self.imageSize = [self scaleSizeWithSize:imageSize];
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self ysl_addTransitionDelegate:self];
    // pop
    [self ysl_popTransitionAnimationWithCurrentScrollView:nil
                                    cancelAnimationPointY:0
                                        animationDuration:0.3
                                  isInteractiveTransition:YES];
}

-(CGSize)scaleSizeWithSize:(CGSize)size{
    CGFloat scale = [UIScreen mainScreen].bounds.size.width / size.width;
    
    CGFloat height = size.height * scale;
    
    
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";


    [self setupMain];

}

- (void)setupMain {
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    
    UIView* contentView = [[UIView alloc] initWithFrame:scrollView.bounds];
    [scrollView addSubview:contentView];
    
    
    UIImageView* avatarImageView = [[UIImageView alloc] init];
    [contentView addSubview:avatarImageView];
    [avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.model.senderAvatar]];
    [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    avatarImageView.layer.cornerRadius = 15;
    avatarImageView.layer.masksToBounds = YES;
    
    
    UILabel* nameLB = [[UILabel alloc] init];
    nameLB.font = [UIFont systemFontOfSize:15];
    nameLB.textColor = [UIColor blackColor];
    [contentView addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(avatarImageView.mas_right).offset(10);
        make.centerY.mas_equalTo(avatarImageView);
    }];
    nameLB.text = self.model.senderNickName;
    
    
    UIButton* followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [followButton setTitle:@"+ 关 注" forState:UIControlStateNormal];
    [followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [followButton setBackgroundColor:[V_Style currentStyle].themePink];
    followButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [contentView addSubview:followButton];
    [followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(avatarImageView);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(70, 25));
    }];
    followButton.layer.cornerRadius = 5;
    followButton.layer.masksToBounds = YES;
    [avatarImageView layoutIfNeeded];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(avatarImageView.frame) + 10, self.imageSize.width ,  self.imageSize.height)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [contentView addSubview:self.imageView];
    
    UILabel* titleLB = [[UILabel alloc] init];
    titleLB.font = [UIFont boldSystemFontOfSize:17];
    titleLB.textColor = [UIColor darkGrayColor];
    titleLB.numberOfLines = 0;
    [contentView addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
    }];
    titleLB.text = self.model.titie;
    
    UILabel* contentLB = [[UILabel alloc] init];
    contentLB.font = [UIFont systemFontOfSize:17];
    contentLB.textColor = [UIColor darkGrayColor];
    contentLB.numberOfLines = 0;
    [contentView addSubview:contentLB];
    [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(titleLB.mas_bottom).offset(5);
    }];
    contentLB.text = self.model.content;
    
    [contentLB layoutIfNeeded];
    
    
    UIImageView* lastStartImaeView = nil;
    for (NSInteger i = 0 ; i < 5; i ++) {
        UIImageView* starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fts_search_poi_star1"]];
        starImageView.frame = CGRectMake(15 + (15 + 20) * i, CGRectGetMaxY(contentLB.frame) + 15, 20, 20);
        if (i == 3) {
            starImageView.image = [UIImage imageNamed:@"fts_search_poi_star2"];
        }
        if (i == 4) {
            starImageView.image = [UIImage imageNamed:@"fts_search_poi_star3"];
        }
        [contentView addSubview:starImageView];
        
        lastStartImaeView = starImageView;
        
    }
    
    contentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, CGRectGetMaxY(lastStartImaeView.frame));
    
    [contentView updateLayout];
    
    NSLog(@"%@",NSStringFromCGRect(contentView.frame));
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, contentView.frame.size.height + 64 + 10);
    
    
}
#pragma mark -- YSLTransitionAnimatorDataSource
- (UIImageView *)popTransitionImageView
{
    return self.imageView;
}

- (UIImageView *)pushTransitionImageView
{
    return nil;
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
