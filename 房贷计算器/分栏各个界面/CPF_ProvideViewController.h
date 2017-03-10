//
//  CPF_ProvideViewController.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>
//**宏定义头文件**//
#import "Common.h"
//**公用单元格，带TextField头文件**//
#import "PublicTableViewCell.h"
//**公用单元格，带分段控制器的单元格头文件**//
#import "Refund_PublicTableViewCell.h"
//**公用单元格，带两个Label的单元格头文件**//
#import "CPF_Custom_1TableViewCell.h"
//**TableView的分类，因为其无法响应点击手势事件，所以为其写一分类**//
#import "UITableView+UITableVIew_UITouch.h"


@interface CPF_ProvideViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

//**公积金贷款页面上的TableView**//
@property (strong, nonatomic) IBOutlet UITableView *CPF_tableView;

//**为了防止是4s/5s打开，其页面上的TableView的顶部会根据软件盘的弹起而自动前缩的一个约束值**//
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *CPF_TableView_TopLayoutRange;

//**将单元格上的textField传来本页面，并用创建的对象接收//
//**页面上的第一个TextField(贷款金额(万元))//
@property (strong, nonatomic) UITextField *textField_1;
//**页面上的第二个TextField(贷款期限(年))//
@property (strong, nonatomic) UITextField *textField_2;
//**页面上的第三个TextField(还款日期(年月))//
@property (strong, nonatomic) UITextField *textField_3;
//**页面上的第四个TextField(贷款利率(%))**//
@property (strong, nonatomic) UITextField *textField_4;

//**将单元格上选择等额本息和等额本金的分段控制器对象，用本页创建的此对象接受，就可以使事件在本页面显示(还款方式)**//
@property (strong, nonatomic)UISegmentedControl *sSegmentedControl;

//**点击第三个TextField时，显示日期**//
@property (strong, nonatomic)UIDatePicker *datePicker;

//**点击第四个TextField时，选择贷款利率**//


//**判断/记录分段控制器现在是等额本金还是等额本息**//
@property (assign, nonatomic) NSInteger NowIsInterestOrCapital;

//**是否已经计算一遍了，即点击分段控制器想切换值**//
@property (assign, nonatomic)BOOL isHaveValue;

//**记录下选择的时间Date格式数据**//
@property (strong, nonatomic)NSDate*chanceDate;

//**另一个记录下选择的时间Date格式数据(是防止计算一遍了之后，再在分段控制器选择另一种模式，保存的临时date数据)**//
@property (strong, nonatomic)NSDate*OtherchanceDate;

//**分区二分区数**//
@property (assign, nonatomic) NSInteger Section_2_Number;

//**分区三分区数**//
@property (assign, nonatomic) NSInteger Section_3_Number;

//**分区一数据(左)**//
@property (strong, nonatomic) NSMutableArray *Section_1DataSource;

//**分区二数据(左)**//
@property (strong, nonatomic) NSMutableArray *Section_2DataSource;

//**累计支付利息**//
@property (strong, nonatomic) NSString *PayInterest;

//**累计还款总额**//
@property (strong, nonatomic) NSString *PayRental;

//**分区三数据(分期还款项的数组/右)**//
@property (strong, nonatomic) NSMutableArray *Section_3DataSource;

//**分区三时间数据数组(左)**//
@property (strong, nonatomic) NSMutableArray *Section_3DataSource_Date;

//**分区三第一个单元格显示的内容，即是等额本息还是等额本金**//
@property (strong, nonatomic)NSString *showSection_3_Row_1;

//**分区三第二个单元格显示的内容，即是等额本息还是等额本金**//
@property (strong, nonatomic)NSString *showSection_3_Row_2;

//**TextField收到的数据，即显示的数据**//
//**贷款金额**//
@property(nonatomic,assign)double LoanMoney;
//**贷款期限**//
@property(nonatomic,assign)NSInteger LoanDeadline;
//**还款日期**//
@property(nonatomic,strong)NSString *strDate;
//**贷款利率**//
@property(nonatomic,assign)double LoanInterest;

//**处理的数据**//
//**每月还款(等额本息)/本金(等额本金)**//
@property(nonatomic,assign)double EveryMonthMoney;
//**月利率**//
@property(nonatomic ,assign)double EveryMonthDouble;
//**剩余金额**//
@property(nonatomic,assign)double surplusMoney;
//**每期还款利息**//
@property(nonatomic,assign)double EveryLoanInterest;
//**每期还款本金(本息)/每期还款总额(本金)**//
@property(nonatomic,assign)double EveryMonthInterest;

//**主要用于标记页面上的TextField的上/下一项的值，相当于其Tag值**//
@property(nonatomic,assign)NSInteger NowIsTextFieldLocation;

@end
