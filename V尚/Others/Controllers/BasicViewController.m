//
//  BasicViewController.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "BasicViewController.h"
#import "DGActivityIndicatorView.h"
@interface BasicViewController ()
@property (nonatomic, strong) DGActivityIndicatorView* indicatorView;
@end

@implementation BasicViewController
- (DGActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeNineDots  tintColor:[UIColor redColor] size:40];
        _indicatorView.frame = self.view.bounds;
        _indicatorView.userInteractionEnabled = NO;
    }
    return _indicatorView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
   

}

- (void)showLoading
{
    [self.view addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}
-(void)hideLoading{
    [self.indicatorView stopAnimating];
    [self.indicatorView removeFromSuperview];
    self.indicatorView = nil;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self keyboadrDeal];

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

#pragma mark keyboard deal
- (void)keyboadrDeal {
    [super didReceiveMemoryWarning];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
}


-(void)keyboardShow:(NSNotification*)notification{
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)]];
}
-(void)hideKeyboard:(UITapGestureRecognizer*)gr{
    [self.view endEditing:YES];
    [self.view removeGestureRecognizer:gr];
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
