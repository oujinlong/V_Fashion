//
//  V_NavigationController.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_NavigationController.h"

@interface V_NavigationController ()

@end

@implementation V_NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    
    if (self.childViewControllers.count > 1) {
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"ysl_navi_back_btn"] forState:UIControlStateNormal];
        //        [button setTitle:viewController.title forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 30, 28);
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItem = item;
        [button addTarget: self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)pop:(UIButton*)button{
    V_NavigationController* vc = (V_NavigationController*)[self getCurrentViewControllerWithButton:button];
    
    [vc popViewControllerAnimated:YES];
}
-(UIViewController *)getCurrentViewControllerWithButton:(UIButton*)button{
    UIResponder *next = [button nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
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
