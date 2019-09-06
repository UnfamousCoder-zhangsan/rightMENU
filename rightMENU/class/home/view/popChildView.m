//
//  popChildView.m
//  rightMENU
//
//  Created by apple on 2019/9/6.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "popChildView.h"
#import "popChildTableViewCell.h"

#define kATTR_VIEW_HEIGHT (kHeight / 3 * 2.2)
///******* 屏幕尺寸 *******/
#define     kWidth      [UIScreen mainScreen].bounds.size.width
#define     kHeight     [UIScreen mainScreen].bounds.size.height
@interface popChildView ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, strong) UITableView *comentTableView;
@property (nonatomic, strong) UIButton    *closeButton;
@property (strong, nonatomic) UILabel  *titleLabel;
@property (strong, nonatomic) UILabel  *bottomLine;

@end

@implementation popChildView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self setupViews];
    }
    self.comentTableView.delegate = self;
    self.comentTableView.dataSource = self;
    return self;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 50, 10, 100, 30)];
        _titleLabel.text = @"拍卖师留言";
    }
    return _titleLabel;
}


- (UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 1)];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}

- (UIButton *)closeButton{
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 10, 30, 30)];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeCilck) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
- (UITableView *)comentTableView{
    if (!_comentTableView) {
        _comentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, kATTR_VIEW_HEIGHT - 70) style:UITableViewStylePlain];
        _comentTableView.backgroundColor = [UIColor whiteColor];
        _comentTableView.separatorInset = UIEdgeInsetsMake(0, 0, 20, 0);
        self.comentTableView.separatorStyle = NO;
        regist_nib(self.comentTableView, popChildTableViewCell);
    }
    return _comentTableView;
}

- (void)closeCilck{
    [self removeView];
}

#pragma mark - setupViews
/**
 *  设置视图的基本内容
 */
- (void)setupViews {
    // 添加手势，点击背景视图消失
    UITapGestureRecognizer *tapBackGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    tapBackGesture.delegate = self;
    [self addGestureRecognizer:tapBackGesture];
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:(CGRect){0, kHeight - kATTR_VIEW_HEIGHT, kWidth, kATTR_VIEW_HEIGHT}];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    [self addSubview:contentView];
    [self.contentView addSubview:self.bottomLine];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.closeButton];
    [self.contentView addSubview:self.comentTableView];
}

#pragma mark - UIGestureRecognizerDelegate
//确定点击范围
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.contentView] || [touch.view isDescendantOfView:self.comentTableView]) {
        return NO;
    }
    return YES;
}


#pragma mark - public
/**
 *  显示属性选择视图
 *
 *  @param view 要在哪个视图中显示
 */
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(0, kHeight, kWidth, kATTR_VIEW_HEIGHT );;
    
    [UIView animateWithDuration:0.2 animations:^{
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _weakSelf.contentView.frame = CGRectMake(0, kHeight - kATTR_VIEW_HEIGHT , kWidth, kATTR_VIEW_HEIGHT);
    }];
}

/**
 *  属性视图的消失
 */
- (void)removeView {
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        _weakSelf.backgroundColor = [UIColor clearColor];
        _weakSelf.contentView.frame = CGRectMake(0, kHeight, kWidth, kATTR_VIEW_HEIGHT);
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}
#pragma mark --
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    popChildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popChildTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



@end
