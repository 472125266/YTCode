//
//  Refund_PublicTableViewCell.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Refund_PublicTableViewCell : UITableViewCell

//单元格上的分段控制器//
@property (strong, nonatomic) IBOutlet UISegmentedControl *sSegmentedController;

//**从VC界面传值显示分段控制器选择哪个的方法，(因为怕一运算后，分段控制器的默认选择变成了1)此方法有返回值，是将此行单元格上的UISegmentedControl返回回去，即将它的地址返回给调用他的页面，使其方法在其调用的VC上设置并显示，使其更好的控制**//
-(UISegmentedControl *)TellCPF_VcUISegmentedControl:(NSInteger)NowSelectionLocation;
@end
