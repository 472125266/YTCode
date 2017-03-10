//
//  CPF_Custom_1TableViewCell.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPF_Custom_1TableViewCell : UITableViewCell

//**单元格显示左边的Label**//
@property (strong, nonatomic) IBOutlet UILabel *InterestLabel;

//**单元格显示右边的Label**//
@property (strong, nonatomic) IBOutlet UILabel *MoneyLabel;

//**单元格显示信息传值方法**//
-(void)updatashowlabelInterest:(NSString *)label1 Money:(NSString *)label2;
@end
