//
//  Set_ViewController.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>
//**宏定义**//
#import "Common.h"
//**带两个Lable的公共自定义单元格**//
#import "CPF_Custom_1TableViewCell.h"

@interface Set_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//**设置页面上的TableVIew**//
@property (strong, nonatomic) IBOutlet UITableView *Set_tableView;

@end
