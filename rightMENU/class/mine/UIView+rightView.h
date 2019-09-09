//
//  UIView+rightView.h
//  rightMENU
//
//  Created by hi  kobe on 2019/9/9.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (rightView)

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat tx;

@property (nonatomic, assign) CGFloat ty;

@end

@interface UIView (FindViewController)

- (nullable UIViewController *)viewController;

@end
NS_ASSUME_NONNULL_END
