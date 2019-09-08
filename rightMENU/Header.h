//
//  Header.h
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#ifndef Header_h
#define Header_h



#define TESTURL  @"http://api.sczcgapp.com/api/v1/"
/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define kMaxNumber 200

#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavBarHeight 44.0
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define TopHeight (BZL_StatusBarHeight + BZL_NavBarHeight) //整个导航栏高度
#define NAV_HEIGHT (StatusBarHeight + NavBarHeight)
#define TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define navigationBarframe [[UIApplication sharedApplication] statusBarFrame];

#define color(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
//屏幕高
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
//屏幕宽
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define regist_nib(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([b class])];
#define regist_collection(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([b class])]
#define regist_collection_header(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([b class])]
#define regist_collection_footer(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([b class])]

#endif /* Header_h */
