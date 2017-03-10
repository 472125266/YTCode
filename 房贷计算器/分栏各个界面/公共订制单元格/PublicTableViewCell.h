//
//  PublicTableViewCell.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicTableViewCell : UITableViewCell

//**显示左边的字的Label**//
@property (strong, nonatomic) IBOutlet UILabel *showLabel;

//**右边的输入值的TextField**//
@property (strong, nonatomic) IBOutlet UITextField *fillTextField;

//**从VC界面传值显示的方法，此方法有返回值，是将此行单元格上的TextField返回回去，即将代理设置为调用他的页面，使其更好的控制**//
-(UITextField *)updataPublicTableViewCell:(NSString *)showLabel1 str2:(NSString *)showLabel2;

@end
