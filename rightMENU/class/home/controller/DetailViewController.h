//
//  DetailViewController.h
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (strong, nonatomic) UIView                *backView;


@property (nonatomic, assign) BOOL isNeedHeader;
@property (nonatomic, assign) BOOL listViewScrollStateSaveEnabled;
@property (nonatomic, assign) CGFloat pinCategoryViewVerticalOffset;
@property (nonatomic, assign) BOOL isNeedScrollToBottom;

@end

NS_ASSUME_NONNULL_END
