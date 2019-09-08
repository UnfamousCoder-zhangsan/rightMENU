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
#import "popChildView.h"

#import "JXPageListView.h"
#import "TestListBaseView.h"
#import "messageView.h"

static const CGFloat JXPageheightForHeaderInSection = 50;

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource,JXCategoryViewDelegate,JXPageListViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *refrshButton;

@property (strong, nonatomic) UIButton *refrshBtn;
@property (strong, nonatomic) popChildView *selectView;

//@property (strong, nonatomic) JXCategoryTitleView *categoryView;


@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property (nonatomic, strong) JXPageListView *pageListView;
//@property (nonatomic, strong) NSArray <TestListBaseView *> *listViewArray;
@property (nonatomic, strong) NSArray  *listViewArray;



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

- (UIButton *)refrshBtn{
    
    if (!_refrshBtn) {
        _refrshBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 55, SCREEN_HEIGHT - 250, 40, 40)];
        [_refrshBtn setBackgroundImage:[UIImage imageNamed:@"refrsh"] forState:UIControlStateNormal];
        [_refrshBtn addTarget:self action:@selector(topbuttonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refrshBtn;
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

    
    
    _titles = @[@"标的信息",@"竞拍公告",@"竞拍须知",@"竞拍记录"];
    
    
    TestListBaseView *powerListView = [[TestListBaseView alloc] init];
    powerListView.isNeedHeader = self.isNeedHeader;
    powerListView.isMessageImage = YES;
    powerListView.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克"].mutableCopy;
    
    
    messageView *hobbyListView  =[[messageView alloc] init];
    hobbyListView.isNeedHeader = self.isNeedHeader;
    
    messageView *partnerListView  =[[messageView alloc] init];
    hobbyListView.isNeedHeader = self.isNeedHeader;
    
    TestListBaseView *partnerListViews = [[TestListBaseView alloc] init];
    partnerListViews.isNeedHeader = self.isNeedHeader;
    partnerListViews.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾",@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美"].mutableCopy;

    
    _listViewArray = @[powerListView, hobbyListView, partnerListView, partnerListViews];
    
    self.pageListView = [[JXPageListView alloc] initWithDelegate:self];
    self.pageListView.listViewScrollStateSaveEnabled = self.listViewScrollStateSaveEnabled;
    self.pageListView.pinCategoryViewVerticalOffset = self.pinCategoryViewVerticalOffset;
    //Tips:pinCategoryViewHeight要赋值
    self.pageListView.pinCategoryViewHeight = JXPageheightForHeaderInSection;
    //Tips:操作pinCategoryView进行配置
    self.pageListView.pinCategoryView.titles = self.titles;
    
    //添加分割线，这个完全自己配置
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, JXPageheightForHeaderInSection - 1, self.view.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
   // [self.pageListView.pinCategoryView addSubview:lineView];
    
    //Tips:成为mainTableView dataSource和delegate的代理，像普通UITableView一样使用它
    self.pageListView.mainTableView.dataSource = self;
    self.pageListView.mainTableView.delegate = self;
    self.pageListView.mainTableView.scrollsToTop = NO;
    [self.pageListView.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.pageListView];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
    
    if (self.isNeedScrollToBottom) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"滚动到底部" style:UIBarButtonItemStylePlain target:self action:@selector(naviRightItemDidClick)];
    }
    
   // regist_nib(self.pageListView.mainTableView, zeroTableViewCell);
    
//    self.mainTabbleView.dataSource = self;
//    self.mainTabbleView.delegate = self;
//    self.mainTabbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.mainTabbleView.backgroundColor = [UIColor whiteColor];
    regist_nib(self.pageListView.mainTableView, zeroTableViewCell);
    regist_nib(self.pageListView.mainTableView, firstTableViewCell);
    regist_nib(self.pageListView.mainTableView, secondTableViewCell);
    regist_nib(self.pageListView.mainTableView, thridTableViewCell);
    regist_nib(self.pageListView.mainTableView, fourTableViewCell);
    
   // [self.mainTabbleView addSubview:self.footerScrollView];
    
    [self setheaderView];
   // [self setfooterView];
    [self.view addSubview:self.refrshBtn];
    
}



-(void)setheaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    headerView.backgroundColor = [UIColor blueColor];
    
    
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.image = [UIImage imageNamed:@"pai_bg"];
    headerImageView.frame = headerView.bounds;
    
    [headerView addSubview:headerImageView];
    
    self.pageListView.mainTableView.tableHeaderView = headerView;
}

-(void)setfooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    footerView.backgroundColor = [UIColor whiteColor];
    
    
//    UIImageView *footerImageView = [[UIImageView alloc] init];
//    footerImageView.frame = footerView.bounds;
//    [footerView addSubview:footerImageView];
    
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    self.categoryView.delegate = self;
    self.categoryView.titles = @[@"标的信息",@"竞拍公告",@"竞拍须知",@"竞拍记录"];
    self.categoryView.titleSelectedColor = [UIColor greenColor];
    self.categoryView.titleColorGradientEnabled = YES;
    
    
    //添加指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = [UIColor greenColor];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.categoryView.indicators = @[lineView];
    [footerView addSubview:self.categoryView];
    
    
    self.pageListView.mainTableView.tableFooterView = footerView;
}
- (void)leftBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)paimaishiLiuYan:(UIButton *)sender {
    NSLog(@"");
}

//#pragma mark --
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
////    if (section == 1) {
////        // //Tips:最后一个section（即listContainerCell所在的section）需要返回1
////        return 1;
////    }
//    return 5;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.row==1 &&indexPath.section ==0) {
//        firstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstTableViewCell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else if (indexPath.row == 2 &&indexPath.section ==0){
//        secondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondTableViewCell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else if (indexPath.row == 3 &&indexPath.section ==0){
//        thridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thridTableViewCell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else if (indexPath.row == 4 &&indexPath.section ==0){
//        fourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourTableViewCell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else if(indexPath.row ==0 &&indexPath.section ==0){
//        zeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroTableViewCell" forIndexPath:indexPath];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//
////    if (indexPath.section == 1) {
////        //Tips:最后一个section（即listContainerCell所在的section）配置listContainerCell
////       // return [self.pageListView listContainerCellForRowAtIndexPath:indexPath];
////    }
//    return nil;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.section == 0) {
//        if (indexPath.row==1) {
//            return 55;
//        }else if(indexPath.row == 2) {
//            return 200;
//        } else if(indexPath.row == 3){
//            return 126;
//        }else if(indexPath.row == 4){
//            return 55;
//        }
//        return 145;
//    }
////    if (indexPath.section == 1) {
////        //Tips:最后一个section（即listContainerCell所在的section）返回listContainerCell的高度
////      //   return [self.pageListView listContainerCellHeight];
////    }
//    return 0;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

- (IBAction)paiMaiClick:(UIButton *)sender {
    
     [self showPopChildView];
    //点击了拍卖师留言
//    sender.selected = !sender.selected;
//    if (sender.selected == YES) {
//        [self showPopChildView];
//    } else {
//        [self.selectView removeView];
//    }
    
}

- (void)showPopChildView{
    self.selectView = [[popChildView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    //显示
    [self.selectView showInView:self.navigationController.view];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.pageListView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TabBarHeight - NAV_HEIGHT);
}

- (void)naviRightItemDidClick {
    [self.pageListView.mainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - JXPageViewDelegate
//Tips:实现代理方法
- (NSArray<UIView<JXPageListViewListDelegate> *> *)listViewsInPageListView:(JXPageListView *)pageListView {
    return self.listViewArray;
}

- (void)pinCategoryView:(JXCategoryBaseView *)pinCategoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;//底部的分类滚动视图需要作为最后一个section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        //Tips:最后一个section（即listContainerCell所在的section）需要返回1
        return 1;
    }
    if (section == 0) {
        return 5;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        //Tips:最后一个section（即listContainerCell所在的section）返回listContainerCell的高度
        return [self.pageListView listContainerCellHeight];
    }
    
    if (indexPath.section == 0) {
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
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        //Tips:最后一个section（即listContainerCell所在的section）配置listContainerCell
        return [self.pageListView listContainerCellForRowAtIndexPath:indexPath];
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row==1) {
            firstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 2 &&indexPath.section ==0){
            secondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 3 &&indexPath.section ==0){
            thridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thridTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 4 &&indexPath.section ==0){
            fourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if(indexPath.row ==0 &&indexPath.section ==0){
            zeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroTableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
    }

    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //Tips:需要传入mainTableView的scrollViewDidScroll事件
    [self.pageListView mainTableViewDidScroll:scrollView];
}
@end
