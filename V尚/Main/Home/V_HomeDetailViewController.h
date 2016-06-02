//
//  V_HomeDetailViewController.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "BasicViewController.h"
#import "V_HomeModel.h"
@interface V_HomeDetailViewController : BasicViewController
-(instancetype)initWithHomeModel:(V_HomeModel*)model imageSize:(CGSize)imageSize;
@end
