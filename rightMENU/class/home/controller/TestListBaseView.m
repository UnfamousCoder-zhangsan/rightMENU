//
//  TestListBaseView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "TestListBaseView.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "TestTableView.h"

#import "testTableViewCell.h"
#import "testImageTableViewCell.h"

@interface TestListBaseView()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property (nonatomic, strong) NSIndexPath *lastSelectedIndexPath;


@end

@implementation TestListBaseView

- (void)dealloc
{
    self.scrollCallback = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[TestTableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.tableFooterView = [UIView new];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self addSubview:self.tableView];
        
        regist_nib(self.tableView, testTableViewCell);
        regist_nib(self.tableView, testImageTableViewCell);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.tableView.frame = self.bounds;
}

- (void)setIsNeedHeader:(BOOL)isNeedHeader {
    _isNeedHeader = isNeedHeader;

    __weak typeof(self)weakSelf = self;
    if (self.isNeedHeader) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [weakSelf.tableView.mj_header endRefreshing];
                if (self.dataSource.count >= 10) {
                    //模拟加载完数据之后添加footer
                    __strong typeof(weakSelf)strongSelf = weakSelf;
                    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [strongSelf.dataSource addObject:@"加载更多成功"];
                            [strongSelf.tableView reloadData];
                            [strongSelf.tableView.mj_footer endRefreshing];
                        });
                    }];
                }else {
                    self.tableView.mj_footer = nil;
                }
            });
        }];
    }
}

- (void)loadMoreDataTest {
    [self.dataSource addObject:@"加载更多成功"];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.isFirstLoaded) {
        //用来模拟未加载就没有数据，测试代码而已
        return 0;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    cell.textLabel.text = self.dataSource[indexPath.row];
//    return cell;
    
    if (self.isMessageImage) {
        testImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testImageTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    testTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.statusLabel.layer.borderColor = [UIColor redColor].CGColor;
        cell.statusLabel.textColor = [UIColor redColor];
        cell.number.textColor = [UIColor redColor];
        cell.price.textColor = [UIColor redColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isMessageImage) {
        return 250;
    }
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//设置heder头
#pragma mark - 自定义headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(15, 8, SCREEN_WIDTH - 30, 32)];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    bgView.layer.cornerRadius = 16;
    bgView.layer.masksToBounds = YES;
    [header addSubview:bgView];
    
    
    UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 25, 10, 50, 30)];
    number.font = [UIFont systemFontOfSize:14];
    number.text = [NSString stringWithFormat:@"竞买号"];
    number.textAlignment = NSTextAlignmentCenter;
    [header addSubview:number];
    
    UILabel *status = [[UILabel alloc]initWithFrame:CGRectMake(38, 10, 50, 30)];
    status.font = [UIFont systemFontOfSize:14];
    status.text = [NSString stringWithFormat:@"状态"];
   // status.textAlignment = NSTextAlignmentCenter;
    [header addSubview:status];
    
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 10, 50, 30)];
    price.font = [UIFont systemFontOfSize:14];
    price.text = [NSString stringWithFormat:@"出价"];
    price.textAlignment = NSTextAlignmentRight;
    [header addSubview:price];
    
    header.backgroundColor = [UIColor whiteColor];
    
    return header;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (self.isMessageImage) {
        return 0;
    }
    return 45;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback?:self.scrollCallback(scrollView);
}

#pragma mark - JXPagingViewListViewDelegate

- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)listViewLoadDataIfNeeded {
    if (!self.isFirstLoaded) {
        self.isFirstLoaded = YES;
        if (self.isNeedHeader) {
            [self.tableView.mj_header beginRefreshing];
        }else {
            [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
                [self.tableView reloadData];

                if (self.dataSource.count >= 10) {
                    //模拟加载完数据之后添加footer
                    __strong typeof(self)weakSelf = self;
                    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [weakSelf.dataSource addObject:@"加载更多成功"];
                            [weakSelf.tableView reloadData];
                            [weakSelf.tableView.mj_footer endRefreshing];
                        });
                    }];
                }else {
                    self.tableView.mj_footer = nil;
                }
            });
        }
    }
}

@end
