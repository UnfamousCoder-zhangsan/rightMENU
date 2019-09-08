//
//  messageView.m
//  rightMENU
//
//  Created by apple on 2019/9/7.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "messageView.h"
#import "WebKit/WebKit.h"


@interface messageView()
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);

@property (nonatomic, strong) UITextView        *textView;


@end


@implementation messageView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _mainSCrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _mainSCrollView.backgroundColor = [UIColor whiteColor];
        //self.textView.frame = self.mainSCrollView.bounds;
        [self.mainSCrollView  addSubview:self.textView];
        [self addSubview:self.mainSCrollView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.mainSCrollView.frame = self.bounds;
}


#pragma mark - JXPagingViewListViewDelegate

- (UIScrollView *)listScrollView {
    return self.mainSCrollView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)listViewLoadDataIfNeeded {
    
}

- (UITextView *)textView {
    if(!_textView){
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH - 20, SCREEN_HEIGHT - TabBarHeight - NAV_HEIGHT - 60)];
        _textView.backgroundColor = [UIColor whiteColor];
        //使用规则
        _textView.editable = NO;
        _textView.userInteractionEnabled = YES;
        
        //_textView.text = @"aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬";
        //字体
        _textView.font = [UIFont boldSystemFontOfSize:14.0];
        
        //对齐
        _textView.textAlignment = NSTextAlignmentLeft;
        //字体颜色
        _textView.textColor = [UIColor grayColor];
        
        _textView.text = @"aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬aaweqtrehgtbwsagas 123456 撒旦法师打发四的发生的 阿斯顿发送到发送到发阿斯顿发生阿斯蒂芬 撒旦法阿斯蒂芬";
//        NSString *useruleString = @"测试呀 展示文本文档";
//        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[useruleString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//
//        //            self.textViewHeight.constant = [self hideLabelLayoutHeight:attributedString withTextFontSize:12];
//        self.textView.attributedText = attributedString;
    }
    return _textView;
}
@end
