//
//  StatisticsApi.m
//  baizheli
//
//  Created by 佰折利 on 2017/11/9.
//  Copyright © 2017年 baizheli. All rights reserved.
//

#import "StatisticsApi.h"

/**
 *  用户 - 登录
 */
NSString *const ELogin = @"APP/API/Login/login";

/**
 *  得到注册验证码
 */
NSString *const RegisterCode = @"APP/API/Login/register";
/**
 *  注册
 */
NSString *const RegisterCount = @"APP/API/Login/register";
/**
 *  首页列表
 */
NSString *const homePagelist = @"APP/API/Index/planlist";
/**
 *  轮播图
 */
NSString *const figureImage = @"APP/API/Index/banner";
/**
 *  昨日战绩
 */
NSString *const Yesterdayrecord = @"APP/API/Index/yesterday";
/**
 *  专家列表
 */
NSString *const ExpertsList = @"APP/API/Experts/list";
/**
 *  关注的专家列表
 */
NSString *const ExpertFocusList = @"APP/API/Experts/focuslist";
/**
 *  关注专家
 */
NSString *const FocusExpert = @"APP/API/Experts/focus";
/**
 *  取消关注专家
 */
NSString *const UNFocusExpert = @"APP/API/Experts/unfocus";
/**
 *  专家详情
 */
NSString *const ExpertDetail = @"APP/API/Experts/show";
/**
 *  包月作者
 */
NSString *const Monthlyauthor = @"APP/API/Experts/buyexpert";
/**
 *  我的包月专家
 */
NSString *const MonthlyExpert = @"APP/API/Experts/monthlyExperts";
/**
 *  获取赛事列表
 */
NSString *const GetEventList = @"APP/API/Games/list";
/**
 *  赛事标签接口
 */
NSString *const GetEventtagsList = @"APP/API/Games/tags";
/**
 *   关注赛事
 */
NSString *const FocusEvent = @"APP/API/Games/focus";
/**
 *   取消关注赛事
 */
NSString *const UNFocusEvent = @"APP/API/Games/unfocus";
/**
 *  得到可用优惠券
 */
NSString *const GetCanUsedcoupons = @"APP/API/Conpon/allcoupon";
/**
 *  得到所有可用优惠券
 */
NSString *const GetallCanUsedcoupons = @"APP/API/Conpon/allcoupon";
/**
 *  领取优惠券
 */
NSString *const ReceiveCoupons = @"APP/API/Conpon/receive";
/**
 *  充值
 */
NSString *const Topupbalance = @"APP/API/Topup/create";
/**
 *  客服与帮助
 */
NSString *const CustomerAndHelp = @"APP/API/Help/commonpros";
/**
 *  问题具体列表
 */
NSString *const CustomerAndHelpDetailList = @"APP/API/Help/list";
/**
 *  方案详情
 */
NSString *const GetPlandetail = @"APP/API/Plan/showplan";
/**
 *  预购买方案
 */
NSString *const FutureBuyType = @"APP/API/Plan/buyplan";
/**
 *  购买方案
 */
NSString *const BuyTypeRightNow = @"APP/API/Plan/buyplan";
/**
 *  根据比赛推荐方案
 */
NSString *const RecommendedPlan = @"APP/API/Plan/advicePlan";
/**
 *  得到用户基本信息
 */
NSString *const GetcountMessage = @"APP/API/User/showUserInfo";
/**
 *  更新用户信息
 */
NSString *const UpdatecountMessage = @"APP/API/User/updateUserInfo";
/**
 *  实名认证
 */
NSString *const RealNameCertification = @"APP/API/User/realName";
/**
 *  单篇文章
 */
NSString *const Getarticle = @"APP/API/Index/shownews";
/**
 *  得到所有问题
 */
NSString *const GetallQuestion = @"APP/API/Question/question";
/**
 *  回答问题
 */
NSString *const AnwserQuestion = @"APP/API/Question/anwser";
/**
 *  未读系统消息数量统计
 */
NSString *const GetunreadMessageNumber = @"APP/API/Message/unreadcout";
/**
 *  得到消息列表
 */
NSString *const GetMessageList = @"APP/API/Message/list";
/**
 *  显示消息详情
 */
NSString *const GetMessageDetail = @"APP/API/Message/show";
/**
 *  删除消息
 */
NSString *const DeletMessage = @"APP/API/Message/del";
/**
 *  我的订单列表
 */
NSString *const MyorderList = @"APP/API/User/orders";
/**
 *  显示提现基本信息
 */
NSString *const withdrawalMsg = @"APP/API/User/showinvitaion";
/**
 *  显示提现下面的列表
 */
NSString *const withdrawalList = @"APP/API/User/invitaionlist";
/**
 *  分享背景图
 */
NSString *const shareBackground = @"APP/API/Index/shareimage";
/**
 *  得到推荐码
 */
NSString *const getRecommendcode = @"APP/API/User/recommendcode";
/**
 *  得到消息推送设置
 */
NSString *const GetPushmessage = @"APP/API/User/pushset";
/**
 *  设置推送消息
 */
NSString *const SettingPushmessage = @"APP/API/User/pushset";
/**
 *  得到免打扰时间
 */
NSString *const GetdisturbTime = @"APP/API/User/dontDisturbTime";
/**
 *  修改密码
 */
NSString *const ChangePassword = @"APP/API/User/resetpwd";
/**
 *  启动页
 */
NSString *const WelcomePage = @"APP/API/Index/advertise";
/**
 *  申请提现
 */
NSString *const Applywithdrawals = @"APP/API/User/addwithdrwal";
/**
 *  重设密码
 */
NSString *const ResetPassword = @"APP/API/Login/resetpwd";
/**
 *  得到忘记密码验证码
 */
NSString *const GetforgetpwdCode = @"APP/API/Login/forgetpwd";
/**
 *  获取支付方式
 */
NSString *const GetpaytypeList = @"APP/API/User/paylist";
