//
//  RequestForms.h
//  baizheli
//
//  Created by 佰折利 on 2017/11/9.
//  Copyright © 2017年 baizheli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestForms : NSObject
/**
 *  单例模式
 *
 */
+ (RequestForms*)sharedInstanceRequestForms;

/**
 *  商家信息 - 登录
 *
 *  @param phone    手机号码
 *  @param password 密码，以字母开头，长度在6~18之间，只能包含字符、数字和下划线
 */
- (NSDictionary *)loginInItWith:(NSString *)phone password:(NSString *)password macString:(NSString *)macString jpushId:(NSString *)jpushId wxToken:(NSString *)wxToken;
/**
 *  商家信息 - 注册
 *
 *  @param phone    手机号码 11
 *  @param password 密码，以字母开头，长度在6~18之间，只能包含字符、数字和下划线
 *  @param vcode    验证码 4
 */
- (NSDictionary *)SignWithPhone:(NSString *)phone Password:(NSString *)password Vcode:(NSString *)vcode;
//发送验证码
-(NSDictionary *)codeWithPhone:(NSString *)phone;
//忘记密码
-(NSDictionary *)updatewithPhone:(NSString *)phone Password:(NSString *)password Code:(NSString *)code Token:(NSString *)token;
//首页列表
-(NSDictionary *)homepagelistdata:(NSString *)page sort:(NSString *)sort type:(NSString *)type;
//昨日战绩
-(NSDictionary *)yesterdayrecord:(NSString *)recordType showTime:(NSString *)showTime;
//包月作者
-(NSDictionary *)Monthlyauthor:(NSString *)ID payType:(NSString *)payType;
//赛事列表
-(NSDictionary *)GetEventList:(NSString *)about gametype:(NSString *)gametype keyword:(NSString *)keyword localDate:(NSString *)localDate showAll:(NSString *)showAll tags:(NSMutableArray *)tags;
//赛事标签接口
-(NSDictionary *)GetEventtagsList:(NSString *)gameType localDate:(NSString *)localDate type:(NSString *)type;
//充值
-(NSDictionary *)Topupbalance:(NSString *)cid payType:(NSString *)payType topupType:(NSString *)topupType;
//购买方案
-(NSDictionary *)BuyTypeRightNow:(NSString *)cid paytype:(NSString *)paytype pid:(NSString *)pid;
//更新用户信息
-(NSDictionary *)UpdatecountMessage:(NSString *)email headimage:(NSString *)headimage nickName:(NSString *)nickName sign:(NSString *)sign;
//重设密码
-(NSMutableDictionary *)ResetPassword:(NSString *)password checkCode:(NSString *)checkCode phone:(NSString *)phone;
@end

