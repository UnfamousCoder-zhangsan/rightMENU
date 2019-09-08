//
//  TestListBaseView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPageListView.h"

@interface TestListBaseView : UIView < JXPageListViewListDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <NSString *> *dataSource;
@property (nonatomic, assign) BOOL isNeedHeader;
@property (nonatomic, assign) BOOL isFirstLoaded;

@property (nonatomic, assign) BOOL isMessageImage; //是否时第一张视图

@end
