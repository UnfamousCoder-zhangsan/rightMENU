//
//  popChildView.h
//  rightMENU
//
//  Created by apple on 2019/9/6.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface popChildView : UIView


/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view;

/**
 *  属性视图的消失
 */
- (void)removeView;

@end

NS_ASSUME_NONNULL_END
