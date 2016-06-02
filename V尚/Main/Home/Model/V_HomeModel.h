//
//  V_HomeModel.h
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface V_HomeModel : NSObject
/**
 *  发布者头像
 */
@property (nonatomic, copy) NSString *senderAvatar;
/**
 *  发布者昵称
 */
@property (nonatomic, copy) NSString *senderNickName;
/**
 *  内容图片地址
 */
@property (nonatomic, copy) NSString *imageUrl;
/**
 *  内容标题
 */
@property (nonatomic, copy) NSString *titie;
/**
 *  内容介绍
 */
@property (nonatomic, copy) NSString *content;
/**
 *  赞的个数
 */
@property (nonatomic, assign) NSInteger zan;
/**
 *  浏览个数
 */
@property (nonatomic, assign) NSInteger views;

/**
 *  是否已经赞过
 */
@property (nonatomic, assign) BOOL isZan;

+(NSArray*)models;

@end
