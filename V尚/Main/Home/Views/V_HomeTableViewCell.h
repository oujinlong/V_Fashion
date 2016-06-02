//
//  V_HomeTableViewCell.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V_HomeModel.h"
@interface V_HomeTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView;
@property (nonatomic, strong) V_HomeModel* model;
@property (nonatomic, weak) UIImageView* contentImageView;
@end
