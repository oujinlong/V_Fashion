//
//  AppDelegate.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "AppDelegate.h"
#import "V_HomeViewController.h"
#import "V_NavigationController.h"
#import "V_LeftSliderViewController.h"
#import "V_WelcomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    
    
    
    
    V_WelcomeViewController* welcomeVc = [[V_WelcomeViewController alloc] init];
    
    self.window.rootViewController = [[V_NavigationController alloc] initWithRootViewController:welcomeVc];//loginVc;// self.home_main;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

-(void)enterHome{
    V_HomeViewController* home = [[V_HomeViewController alloc] init];
    V_LeftSliderViewController * leftVc = [[V_LeftSliderViewController alloc] init];

    self.home_main = [[ICSDrawerController alloc] initWithLeftViewController:leftVc centerViewController:[[V_NavigationController alloc] initWithRootViewController:home]];
    
    self.window.rootViewController = self.home_main;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
