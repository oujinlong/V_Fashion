//
//  OUInputValidate.m
//  YJProject
//
//  Created by oujinlong on 16/4/28.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OUInputValidate.h"

@implementation OUInputValidate

+ (BOOL) validateNickName:(NSString *)nickName
{
    if (nickName.length == 0) {
        return NO;
    }
    if (nickName.length >= 2 && nickName.length <=16) {
        return YES;
    }
    return NO;
}

//验证码6位
+ (BOOL) validateVerifyCode: (NSString *)verifyCode
{
    BOOL flag;
    if (verifyCode.length != 4) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{4})";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:verifyCode];
}

//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,19})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^1([3-9])\\d{9}";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phonePredicate evaluateWithObject:mobile];
}

//汉字姓名
+ (BOOL) validateName:(NSString *)name
{
    if (name.length == 0) {
        return NO;
    }
    
    return YES;
    //    NSString *nameRegex = @"[\\u4e00-\\u9fa5]{2,15}";
    //    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    //    return [namePredicate evaluateWithObject:name];
    
}

//信用卡有效期
+ (BOOL) validateCreditValidity:(NSString *)validity
{
    if (validity.length != 4) {
        return NO;
    }
    NSString *regex = @"^(\\d{4})";
    NSPredicate *validityPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [validityPredicate evaluateWithObject:validity];
}

//信用卡cvv2
+ (BOOL) validateCreditCVV2:(NSString *)cvv2
{
    if (cvv2.length != 3) {
        return NO;
    }
    NSString *regex = @"^(\\d{3})";
    NSPredicate *cvv2Predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [cvv2Predicate evaluateWithObject:cvv2];
}

+ (BOOL)validatePassword:(NSString *)password;
{
    NSString *pattern = @"^[A-Za-z0-9]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
