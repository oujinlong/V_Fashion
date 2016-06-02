//
//  V_NavSegView.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_NavSegView.h"
#import "Masonry.h"

@interface V_NavSegView ()
@property (nonatomic, weak) UIButton* leftButton;
@property (nonatomic, weak) UIButton* rightButton;
@property (nonatomic, weak) UIView* indicatorView;
@end
@implementation V_NavSegView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupMain];
    }
    return self;
}

-(void)setupMain{
    
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton = leftButton;
    [leftButton setTitle:@"最新" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    leftButton.selected = YES;
    [self addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(40);
    }];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* line = [[UIView alloc] init];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftButton.mas_right).offset(5);
        make.width.mas_equalTo(1);
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
    }];
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton = rightButton;
    [rightButton setTitle:@"专题" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_right).offset(5);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(40);
    }];
    
    UIView* indicatiorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 3, 40, 3)];
    self.indicatorView = indicatiorView;
    indicatiorView.backgroundColor = [UIColor blackColor];
    indicatiorView.layer.cornerRadius = 5;
    indicatiorView.layer.masksToBounds = YES;
    [self addSubview:indicatiorView];
//    [indicatiorView mas_makeConstraints:^(MASConstraintMaker *make) {
//     
//        make.width.mas_equalTo(leftButton);
//        make.top.mas_equalTo(leftButton.mas_bottom);
//        make.left.mas_equalTo(self.leftButton);
//        make.height.mas_equalTo(3);
//    }];
    
    
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick:(UIButton*)button{
    NSInteger index = button == self.leftButton ? 0: 1;
    
    [self.delegate V_NavSegView:self didSelectAtIndex:index];
    
    self.leftButton.selected = index == 0;
    
    self.rightButton.selected = index == 1;
    
    
    if (index == 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.indicatorView.frame = CGRectMake(0, self.indicatorView.frame.origin.y, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
        }];
    
    }else{
        [UIView animateWithDuration:0.2 animations:^{
           self.indicatorView.frame = CGRectMake(self.rightButton.frame.origin.x, self.indicatorView.frame.origin.y, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
        }];
    
    }
}

@end
