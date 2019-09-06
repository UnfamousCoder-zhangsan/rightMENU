//
//  fourTableViewCell.m
//  rightMENU
//
//  Created by hi  kobe on 2019/9/5.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "fourTableViewCell.h"

@implementation fourTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.phoneString = @"12345678909";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)callphoneButton:(UIButton *)sender {
    NSString *phone = @"12345678988";
    NSMutableString *phoneString = [NSMutableString stringWithFormat:@"tel:%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneString]];
}

@end
