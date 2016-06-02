//
//  AppDelegate.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) ICSDrawerController* home_main;


-(void)enterHome;
@end

