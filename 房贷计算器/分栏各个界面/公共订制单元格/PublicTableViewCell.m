//
//  PublicTableViewCell.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "PublicTableViewCell.h"

@implementation PublicTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
#pragma mark -
#pragma mark 显示传值的方法
-(UITextField *)updataPublicTableViewCell:(NSString *)showLabel1 str2:(NSString *)showLabel2{
    _showLabel.text = showLabel1;
    _fillTextField.text = showLabel2;
    return _fillTextField;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
