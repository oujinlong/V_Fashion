//
//  V_LoginViewController.h
//  V尚
//
//  Created by oujinlong on 16/5/25.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "BasicViewController.h"
typedef enum {
    V_LoginRegistViewControllerTypeLogin = 0,
    V_LoginRegistViewControllerTypeRegist = 1
}V_LoginRegistViewControllerType;

@interface V_LoginRegistViewController : BasicViewController

-(instancetype)initWithType:(V_LoginRegistViewControllerType)type;
@end
