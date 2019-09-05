//
//  DetailViewController.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "DetailViewController.h"
#import "firstTableViewCell.h"
#import "secondTableViewCell.h"
#import "thridTableViewCell.h"
#import "zeroTableViewCell.h"
#import "fourTableViewCell.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTabbleView;
@property (weak, nonatomic) IBOutlet UIButton *refrshButton;

@end

@implementation DetailViewController

@synthesize backView;
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = NO;
}


-(void)topbuttonPressed{
    //刷新界面
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"拍品详情";
    
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    backView.opaque = YES;
    [backView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(2, 3, 25  , 25)];
    //#warning 注意修改图片
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"backarrow" ofType:@"png"];
    [imageview setImage:[UIImage imageNamed:@"leftback"]];
    [backView addSubview:imageview];
    [barbtnLeft setCustomView:backView];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftBack)];
    [backView addGestureRecognizer:tapges];
    self.navigationItem.leftBarButtonItem = barbtnLeft;
    
//    self.refrshButton.layer.cornerRadius = 40 / 2;
//    self.refrshButton.layer.masksToBounds = YES;
    
    self.mainTabbleView.dataSource = self;
    self.mainTabbleView.delegate = self;
    self.mainTabbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTabbleView.backgroundColor = [UIColor whiteColor];
    regist_nib(self.mainTabbleView, zeroTableViewCell);
    regist_nib(self.mainTabbleView, firstTableViewCell);
    regist_nib(self.mainTabbleView, secondTableViewCell);
    regist_nib(self.mainTabbleView, thridTableViewCell);
    regist_nib(self.mainTabbleView, fourTableViewCell);
    
    [self setheaderView];
    [self setfooterView];
}

-(void)setheaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    headerView.backgroundColor = [UIColor blueColor];
    
    
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.image = [UIImage imageNamed:@"pai_bg"];
    headerImageView.frame = headerView.bounds;
    
    [headerView addSubview:headerImageView];
    
    self.mainTabbleView.tableHeaderView = headerView;
}

-(void)setfooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    footerView.backgroundColor = [UIColor blueColor];
    
    
    UIImageView *footerImageView = [[UIImageView alloc] init];
    footerImageView.frame = footerView.bounds;
    [footerView addSubview:footerImageView];
    
    self.mainTabbleView.tableFooterView = footerView;
}
- (void)leftBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)paimaishiLiuYan:(UIButton *)sender {
    NSLog(@"");
}

#pragma mark --
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==1) {
        firstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2){
        secondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 3){
        thridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thridTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 4){
        fourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        zeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==1) {
        return 55;
    }else if(indexPath.row == 2) {
        return 200;
    } else if(indexPath.row == 3){
        return 126;
    }else if(indexPath.row == 4){
        return 55;
    }
    return 145;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}


@end
