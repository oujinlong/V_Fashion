//
//  V_LoginView.h
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "BasicView.h"
@class V_LoginView;
@protocol V_LoginViewDelegate <NSObject>

-(void)V_LoginViewDidClickRegist:(V_LoginView*)V_LoginView;

-(void)V_LoginView:(V_LoginView*)V_LoginView didFinishLoginWithUserName:(NSString*)userName;
@end
@interface V_LoginView : BasicView
-(instancetype)initWithIsLogin:(BOOL)isLogin;
-(void)becomeFirstResponder;

@property (nonatomic, weak) id <V_LoginViewDelegate> delegate;
@end
