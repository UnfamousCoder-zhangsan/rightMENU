//
//  AppDelegate.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "AppDelegate.h"
//#import "MainTabbarViewController.h"
#import "mineViewController.h"
#import "MainTabbarViewController.h"
#import "rightView.h"
#import "UIView+rightView.h"
#import "MNDrawerManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];
    
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.mainTab = [main instantiateViewControllerWithIdentifier:@"TabBarView"];
        self.mainTab.selectedIndex = 0;
//
//       ((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController = self.mainTab;
//       // self.window.rootViewController = self.mainTab;
//        [self.window makeKeyAndVisible];
    
        rightView *right = [[rightView alloc] initWithFrame:CGRectMake(- self.window.width * (1 - kLeftWidthScale), 0, self.window.width, self.window.height)];
    
       [[MNDrawerManager instance] installCenterViewController:self.mainTab leftView:right];
    
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
