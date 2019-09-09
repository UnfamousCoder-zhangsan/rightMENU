//
//  MainTabbarViewController.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "homeViewController.h"
#import "mineViewController.h"
#import "MNDrawerManager.h"

@interface MainTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    // Do any additional setup after loading the view.
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
}

- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    UINavigationController *navigationController = (UINavigationController *)viewController;
    UIViewController *_viewController = navigationController.viewControllers.firstObject;
    
    // 如果选中消息页，响应拖拽手势，可以显示侧边栏
    // 否则取消手势响应，不能显示侧边栏
    if ([_viewController isKindOfClass:[homeViewController class]]) {
        [[MNDrawerManager instance] beginDragResponse];
    } else {
        [[MNDrawerManager instance] cancelDragResponse];
    }
}

@end
