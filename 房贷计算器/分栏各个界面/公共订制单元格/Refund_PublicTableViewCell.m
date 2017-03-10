//
//  Refund_PublicTableViewCell.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "Refund_PublicTableViewCell.h"

@implementation Refund_PublicTableViewCell

- (void)awakeFromNib {
}
#pragma mark -
#pragma mark VC调用方法传值，设置分段控制器显示选择哪个
-(UISegmentedControl *)TellCPF_VcUISegmentedControl:(NSInteger)NowSelectionLocation{
    _sSegmentedController.selectedSegmentIndex = NowSelectionLocation;
    return _sSegmentedController;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
