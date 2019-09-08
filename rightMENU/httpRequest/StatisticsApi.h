//
//  StatisticsApi.h
//  baizheli
//
//  Created by 佰折利 on 2017/11/9.
//  Copyright © 2017年 baizheli. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户 - 登录
 */
FOUNDATION_EXPORT NSString *const ELogin;

/**
 *  得到注册验证码
 */
FOUNDATION_EXPORT   NSString *const RegisterCode;
/**
 *  注册
 */
FOUNDATION_EXPORT  NSString *const RegisterCount;
/**
 *  首页列表
 */
FOUNDATION_EXPORT  NSString *const homePagelist;
/**
 *  轮播图
 */
FOUNDATION_EXPORT  NSString *const figureImage;
/**
 *  昨日战绩
 */
FOUNDATION_EXPORT  NSString *const Yesterdayrecord;
/**
 *  专家列表
 */
FOUNDATION_EXPORT  NSString *const ExpertsList;
/**
 *  关注的专家列表
 */
FOUNDATION_EXPORT  NSString *const ExpertFocusList;
/**
 *  关注专家
 */
FOUNDATION_EXPORT  NSString *const FocusExpert;
/**
 *  取消关注专家
 */
FOUNDATION_EXPORT  NSString *const UNFocusExpert;
/**
 *  专家详情
 */
FOUNDATION_EXPORT  NSString *const ExpertDetail;

/**
 *  包月作者
 */
FOUNDATION_EXPORT  NSString *const Monthlyauthor;
/**
 *  我的包月专家
 */
FOUNDATION_EXPORT  NSString *const MonthlyExpert;
/**
 *  赛事列表
 */
FOUNDATION_EXPORT  NSString *const GetEventList;
/**
 *  赛事标签接口
 */
FOUNDATION_EXPORT  NSString *const GetEventtagsList;
/**
 *   关注赛事
 */
FOUNDATION_EXPORT  NSString *const FocusEvent;
/**
 *   取消关注赛事
 */
FOUNDATION_EXPORT  NSString *const UNFocusEvent;
/**
 *  得到可用优惠券
 */
FOUNDATION_EXPORT  NSString *const GetCanUsedcoupons;
/**
 *  得到所有可用优惠券
 */
FOUNDATION_EXPORT  NSString *const GetallCanUsedcoupons;
/**
 *  领取优惠券
 */
FOUNDATION_EXPORT  NSString *const ReceiveCoupons;
/**
 *  充值
 */
FOUNDATION_EXPORT  NSString *const Topupbalance;
/**
 *  客服与帮助
 */
FOUNDATION_EXPORT  NSString *const CustomerAndHelp;
/**
 *  问题具体列表
 */
FOUNDATION_EXPORT  NSString *const CustomerAndHelpDetailList;
/**
 *  方案详情
 */
FOUNDATION_EXPORT  NSString *const GetPlandetail;
/**
 *  预购买方案
 */
FOUNDATION_EXPORT  NSString *const FutureBuyType;
/**
 *  购买方案
 */
FOUNDATION_EXPORT  NSString *const BuyTypeRightNow;
/**
 *  根据比赛推荐方案
 */
FOUNDATION_EXPORT  NSString *const RecommendedPlan;
/**
 *  得到用户基本信息
 */
FOUNDATION_EXPORT  NSString *const GetcountMessage;
/**
 *  更新用户信息
 */
FOUNDATION_EXPORT  NSString *const UpdatecountMessage;
/**
 *  实名认证
 */
FOUNDATION_EXPORT  NSString *const RealNameCertification;
/**
 *  单篇文章
 */
FOUNDATION_EXPORT  NSString *const Getarticle;
/**
 *  得到所有问题
 */
FOUNDATION_EXPORT  NSString *const GetallQuestion;
/**
 *  回答问题
 */
FOUNDATION_EXPORT  NSString *const AnwserQuestion;
/**
 *  未读系统消息数量统计
 */
FOUNDATION_EXPORT  NSString *const GetunreadMessageNumber;
/**
 *  得到消息列表
 */
FOUNDATION_EXPORT  NSString *const GetMessageList;
/**
 *  显示消息详情
 */
FOUNDATION_EXPORT  NSString *const GetMessageDetail;
/**
 *  删除消息
 */
FOUNDATION_EXPORT  NSString *const DeletMessage;
/**
 *  我的订单列表
 */
FOUNDATION_EXPORT  NSString *const MyorderList;
/**
 *  显示提现基本信息
 */
FOUNDATION_EXPORT  NSString *const withdrawalMsg;
/**
 *  显示提现下面的列表
 */
FOUNDATION_EXPORT  NSString *const withdrawalList;
/**
 *  分享背景图
 */
FOUNDATION_EXPORT  NSString *const shareBackground;
/**
 *  得到推荐码
 */
FOUNDATION_EXPORT  NSString *const getRecommendcode;
/**
 *  得到消息推送设置
 */
FOUNDATION_EXPORT  NSString *const GetPushmessage;
/**
 *  设置推送消息
 */
FOUNDATION_EXPORT  NSString *const SettingPushmessage;
/**
 *  得到免打扰时间
 */
FOUNDATION_EXPORT  NSString *const GetdisturbTime;
/**
 *  修改密码
 */
FOUNDATION_EXPORT  NSString *const ChangePassword;
/**
 *  启动页
 */
FOUNDATION_EXPORT  NSString *const WelcomePage;
/**
 *  申请提现
 */
FOUNDATION_EXPORT  NSString *const Applywithdrawals;
/**
 *  重设密码
 */
FOUNDATION_EXPORT  NSString *const ResetPassword;
/**
 *  得到忘记密码验证码
 */
FOUNDATION_EXPORT  NSString *const GetforgetpwdCode;
/**
 *  获取支付方式
 */
FOUNDATION_EXPORT  NSString *const GetpaytypeList;
//http://192.168.16.138:8080/detai/tuij?gid=123&rote=homes//直播


