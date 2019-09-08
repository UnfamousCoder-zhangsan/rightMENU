//
//  messageView.h
//  rightMENU
//
//  Created by apple on 2019/9/7.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXPageListView.h"


NS_ASSUME_NONNULL_BEGIN

@interface messageView : UIView <JXPageListViewListDelegate>
@property (strong, nonatomic) UIScrollView *mainSCrollView;
@property (nonatomic, assign) BOOL isNeedHeader;
@property (nonatomic, assign) BOOL isFirstLoaded;

@end

NS_ASSUME_NONNULL_END
