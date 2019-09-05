//
//  MainNavigationController.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        [[UINavigationBar appearance] setTranslucent:NO];
        //        [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];//打开隐藏导航栏下面的黑线
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:242.0/255 green:34.0/255 blue:34.0/255 alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
    //    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]} forState:UIControlStateNormal];
    
    
    UIBarButtonItem *apperance = [UIBarButtonItem appearance];
    
    //uitextattributetextcolor替代方法
    
    [apperance setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
