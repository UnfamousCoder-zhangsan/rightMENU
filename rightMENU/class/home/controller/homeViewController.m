//
//  homeViewController.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "homeViewController.h"
#import "DetailViewController.h"


@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)detailView:(UIButton *)sender {
    
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    //testViewController *vc = [[testViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    //[self.navigationController pushViewController:detailVC animated:YES];
    //跳转到商品详情
    
    vc.isNeedHeader = YES;
    vc.listViewScrollStateSaveEnabled = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
