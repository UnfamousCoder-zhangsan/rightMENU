//
//  testTableViewCell.m
//  rightMENU
//
//  Created by apple on 2019/9/7.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "testTableViewCell.h"

@implementation testTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.statusLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.statusLabel.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
