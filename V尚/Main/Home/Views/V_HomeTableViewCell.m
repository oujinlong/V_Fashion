//
//  V_HomeTableViewCell.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_HomeTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIView+SDAutoLayout.h"
@interface V_HomeTableViewCell ()
@property (nonatomic, weak) UIImageView* avatarImageView;
@property (nonatomic, weak) UILabel* nameLB;
@property (nonatomic, weak) UILabel* titleLB;
@property (nonatomic, weak) UILabel* contentLB;
@property (nonatomic, weak) UILabel* zanLB;
@property (nonatomic, weak) UILabel* viewLB;
@property (nonatomic, weak) UIButton* zanButton;
@end
@implementation V_HomeTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString* const identifier = @"HomeCell";
    V_HomeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[V_HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupMain];
    }
    
    return self;
}

-(void)setupMain{
    UIImageView* avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView = avatarImageView;
    CGFloat avatar_width = 45;
    [self.contentView addSubview:avatarImageView];
    [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(avatar_width, avatar_width));
    }];
    avatarImageView.layer.cornerRadius = avatar_width / 2;
    avatarImageView.layer.masksToBounds = YES;
    
    UILabel* nameLB = [[UILabel alloc] init];
    self.nameLB = nameLB;
    nameLB.font = [UIFont systemFontOfSize:15];
    nameLB.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(avatarImageView.mas_right).offset(10);
        make.centerY.mas_equalTo(avatarImageView);
    }];
    
    UIImageView* contentImageView = [[UIImageView alloc] init];
    self.contentImageView = contentImageView;
    [self.contentView addSubview:contentImageView];
    [contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(avatarImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(250);
    }];
    contentImageView.contentMode = UIViewContentModeScaleToFill;
    contentImageView.clipsToBounds = YES;
    
    UILabel* titleLB = [[UILabel alloc] init];
    self.titleLB = titleLB;
    titleLB.font = [UIFont boldSystemFontOfSize:16];
    titleLB.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(contentImageView.mas_bottom).offset(10);
    }];
    
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1.2);
        make.top.mas_equalTo(titleLB.mas_bottom).offset(5);
    }];
    
    UILabel* contentLB = [[UILabel alloc] init];
    contentLB.numberOfLines = 0;
    self.contentLB = contentLB;
    contentLB.font = [UIFont systemFontOfSize:14];
    contentLB.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:contentLB];
    [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLB);
        make.top.mas_equalTo(line.mas_bottom).offset(5);
        make.right.mas_equalTo(-10);
    }];
    
    
    UIButton* zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zanButton = zanButton;
    [zanButton setBackgroundImage:[UIImage imageNamed:@"AlbumLikeGolden"] forState:UIControlStateNormal];
    [zanButton setBackgroundImage:[UIImage imageNamed:@"braceletLiked"] forState:UIControlStateSelected];
    [self.contentView addSubview:zanButton];
    [zanButton addTarget: self action:@selector(zanClick:) forControlEvents:UIControlEventTouchUpInside];
    [zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(contentLB.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    UILabel* zanLB = [[UILabel alloc] init];
    self.zanLB = zanLB;
    zanLB.font = [UIFont systemFontOfSize:15];
    zanLB.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:zanLB];
    [zanLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(zanButton.mas_right).offset(8);
        make.centerY.mas_equalTo(zanButton);
    }];
    
    
    UIImageView* viewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellHidePassword_icon_HL"]];
    [self.contentView addSubview:viewImageView];
    [viewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(zanLB.mas_right).offset(15);
        make.centerY.mas_equalTo(zanButton);
        make.size.mas_equalTo(CGSizeMake(25, 20));
    }];
    
    UILabel* viewLB = [[UILabel alloc] init];
    self.viewLB = viewLB;
    viewLB.font = [UIFont systemFontOfSize:15];
    viewLB.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:viewLB];
    [viewLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewImageView.mas_right).offset(8);
        make.centerY.mas_equalTo(zanButton);
    }];

    
    [self setupAutoHeightWithBottomView:zanButton bottomMargin:10];
}
#pragma mark button click
-(void)zanClick:(UIButton*)button{
    button.selected = !button.selected;
    
    self.model.isZan = button.selected;
    
    self.zanLB.text = [NSString stringWithFormat:@"%zd", button.isSelected ? self.model.zan +1:self.model.zan ];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:button.frame];
    imageView.image = [UIImage imageNamed:@"braceletLiked"];
    [self.contentView addSubview:imageView];
    [UIView animateWithDuration:1 animations:^{
        imageView.transform = CGAffineTransformMakeTranslation(15, -80);
        imageView.alpha = 0.1;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
    
}
-(void)setModel:(V_HomeModel *)model{
    _model = model;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.senderAvatar] placeholderImage:[UIImage imageNamed:@"placeholder.lpg"]];
    
    
    self.nameLB.text = model.senderNickName;
    
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
    self.titleLB.text = model.titie;
    
    self.contentLB.text = model.content;
    
    self.zanLB.text = [NSString stringWithFormat:@"%zd",model.zan];
    
    self.viewLB.text = [NSString stringWithFormat:@"%zd",model.views];
    
    self.zanButton.selected = model.isZan;
    
}
@end
