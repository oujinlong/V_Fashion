//
//  V_NavSegView.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class V_NavSegView;
@protocol V_NavSegViewDelegate <NSObject>

-(void)V_NavSegView:(V_NavSegView*)V_NavSegView didSelectAtIndex:(NSInteger)index;

@end
@interface V_NavSegView : UIView
@property (nonatomic, weak) id <V_NavSegViewDelegate>delegate;
@end
