//
//  RequestForms.m
//  baizheli
//
//  Created by 佰折利 on 2017/11/9.
//  Copyright © 2017年 baizheli. All rights reserved.
//

#import "RequestForms.h"
#import <CommonCrypto/CommonDigest.h>
@implementation RequestForms
//单列方法
+ (id)sharedInstanceRequestForms{
    static RequestForms *_sharedRequestForms = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRequestForms = [[RequestForms alloc] init];
    });
    return _sharedRequestForms;
}

/**
 *  商家信息 - 登录
 *
 *  @param phone    手机号码
 *  @param password 密码，以字母开头，长度在6~18之间，只能包含字符、数字和下划线
 */
- (NSDictionary *)loginInItWith:(NSString *)phone password:(NSString *)password macString:(NSString *)macString jpushId:(NSString *)jpushId wxToken:(NSString *)wxToken{
    
    NSMutableDictionary *postInfo =[NSMutableDictionary dictionary];
    [postInfo setValue:phone forKey:@"username"];
    [postInfo setValue:password forKey:@"password"];
    [postInfo setValue:macString forKey:@"imie"];
    [postInfo setValue:jpushId forKey:@"jpushId"];
    [postInfo setValue:wxToken forKey:@"wxToken"];
    return postInfo;
}
//发送验证码
-(NSDictionary *)codeWithPhone:(NSString *)phone{
    NSMutableDictionary *postInfo =[NSMutableDictionary dictionary];
    [postInfo setValue:phone forKey:@"phone"];
    return postInfo;
}
//更改密码
-(NSDictionary *)updatewithPhone:(NSString *)phone Password:(NSString *)password Code:(NSString *)code Token:(NSString *)token{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:phone forKey:@"phone"];
    [postInfo setValue:password forKey:@"passWord"];
    [postInfo setValue:code forKey:@"code"];
    return postInfo;
}
//首页列表
-(NSDictionary *)homepagelistdata:(NSString *)page sort:(NSString *)sort type:(NSString *)type{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
//    [postInfo setValue:page forKey:@"page"];
     [postInfo setValue:sort forKey:@"sort"];
     [postInfo setValue:type forKey:@"type"];
    return postInfo;
}
///昨日战绩
-(NSDictionary *)yesterdayrecord:(NSString *)recordType showTime:(NSString *)showTime{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:recordType forKey:@"recordType"];
    [postInfo setValue:showTime forKey:@"showTime"];
    return postInfo;
}
//包月作者
-(NSDictionary *)Monthlyauthor:(NSString *)ID payType:(NSString *)payType{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:ID forKey:@"eid"];
    [postInfo setValue:payType forKey:@"payType"];
    [postInfo setValue:@"" forKey:@"openid"];
    return postInfo;
}
//赛事列表
-(NSDictionary *)GetEventList:(NSString *)about gametype:(NSString *)gametype keyword:(NSString *)keyword localDate:(NSString *)localDate showAll:(NSString *)showAll tags:(NSMutableArray *)tags{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:about forKey:@"about"];
    [postInfo setValue:gametype forKey:@"gameType"];
    [postInfo setValue:keyword forKey:@"keyword"];
    [postInfo setValue:localDate forKey:@"localDate"];
    [postInfo setValue:showAll forKey:@"showAll"];
    [postInfo setValue:tags forKey:@"tags"];
    return postInfo;
}
//赛事标签接口
-(NSDictionary *)GetEventtagsList:(NSString *)gameType localDate:(NSString *)localDate type:(NSString *)type{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:gameType forKey:@"gameType"];
    [postInfo setValue:localDate forKey:@"localDate"];
    [postInfo setValue:type forKey:@"type"];
    return postInfo;
}
//充值
-(NSDictionary *)Topupbalance:(NSString *)cid payType:(NSString *)payType topupType:(NSString *)topupType{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:cid forKey:@"cid"];
    [postInfo setValue:payType forKey:@"payType"];
    [postInfo setValue:topupType forKey:@"topupType"];
    return postInfo;
}
//购买方案
-(NSDictionary *)BuyTypeRightNow:(NSString *)cid paytype:(NSString *)paytype pid:(NSString *)pid{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:cid forKey:@"cid"];
    [postInfo setValue:paytype forKey:@"payType"];
    [postInfo setValue:pid forKey:@"pid"];
    return postInfo;
}
//更新用户信息
-(NSDictionary *)UpdatecountMessage:(NSString *)email headimage:(NSString *)headimage nickName:(NSString *)nickName sign:(NSString *)sign{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:email forKey:@"email"];
    [postInfo setValue:headimage forKey:@"headImg"];
    [postInfo setValue:nickName forKey:@"nickName"];
    [postInfo setValue:sign forKey:@"sign"];
    return postInfo;
}
//重设密码
-(NSMutableDictionary *)ResetPassword:(NSString *)password checkCode:(NSString *)checkCode phone:(NSString *)phone{
    NSMutableDictionary *postInfo=[NSMutableDictionary dictionary];
    [postInfo setValue:password forKey:@"password"];
    [postInfo setValue:checkCode forKey:@"checkCode"];
    [postInfo setValue:phone forKey:@"phone"];
    
    return postInfo;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
-(NSString *)JSONString:(id)theArray{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theArray
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
-(NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}
@end

