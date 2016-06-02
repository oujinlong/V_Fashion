//
//  OUInputValidate.h
//
//
//  Created by oujinlong on 16/4/28.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OUInputValidate : NSObject

+ (BOOL) validateIdentityCard:(NSString *)identityCard;

//+ (BOOL) validateIDCardNumber:(NSString *)value;

+ (BOOL) validateMobile:(NSString *)mobile;

+ (BOOL) validateName:(NSString *)name;

+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;

+ (BOOL) validateVerifyCode: (NSString *)verifyCode;

+ (BOOL) validateCreditValidity:(NSString *)validity;

+ (BOOL) validateCreditCVV2:(NSString *)cvv2;

+ (BOOL) validatePassword:(NSString *)password;

+ (BOOL) validateNickName:(NSString *)nickName;

+ (BOOL) validateEmail:(NSString *)email;

@end
