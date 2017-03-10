//
//  CPF_Custom_1TableViewCell.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "CPF_Custom_1TableViewCell.h"

@implementation CPF_Custom_1TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
#pragma mark -
#pragma mark 单元格显示信息设置方法
-(void)updatashowlabelInterest:(NSString *)label1 Money:(NSString *)label2{
    _InterestLabel.text = label1;
    _MoneyLabel.text = label2;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
