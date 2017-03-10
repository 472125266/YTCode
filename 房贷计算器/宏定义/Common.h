//
//  Common.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//**导入获得设备屏幕的头文件**//
#import "sys/utsname.h"

#pragma mark -
#pragma mark 公共参数

//**分区头高度**//
#define Commonality_TableView_SectionHeadHigh 15

//**分区尾高度**//
#define Commonality_TableView_SectionFootHigh 1

//**单元格高度**//
#define Commonality_TableView_SectionRowHigh 60

//**日期选择器的宽**//
#define Commonality_DatePicker_Width self.view.frame.size.width

//**日期选择器的高(此值是大概估计的，暂时写死了)**//
#define Commonality_DatePicker_High 258

//**判断当前打开设备类型是否为4/4s**//
#define Commonality_OpenQuipment_iPhone_4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//**判断当前打开设备类型是否为5/5s**//
#define Commonality_OpenQuipment_iPhone_5_5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//**判断当前打开设备类型是否为6/6s**//
#define Commonality_OpenQuipment_iPhone_6_6s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//**判断当前打开设备类型是否为6 Plus/6s Plus **//
#define Commonality_OpenQuipment_iPhone_6Plus_6sPlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark -
#pragma mark 公积金页面

//**分区1的几个数据显示**//
#define CPF_Section_1_DataSourceArray @"贷款金额(万元)",@"贷款期限(年)",@"还款日期(年月)",@"贷款利率(%)",@"还款方式"

//**分区1的几个数据显示**//
#define CPF_Section_2_DataSourceArray @"累计支付利息(元)",@"累计还款总额"

//**公积金默认利率**//
#define CPF_AccumulationFund_Default 3.25

#pragma mark -
#pragma mark 商业贷款页面

//**分区1的几个数据显示**//
#define Trade_Section_1_DataSourceArray @"贷款金额(万元)",@"贷款期限(年)",@"还款日期(年月)",@"贷款利率(%)",@"贷款利率折扣(倍)",@"还款方式"

//**分区1的几个数据显示**//
#define Trade_Section_2_DataSourceArray @"贷款利率(%)",@"累计支付利息(元)",@"累计还款总额"

//**商业默认利率**//
#define Trade_AccumulationFund_Default 4.90

//**商业默认利率**//
#define Trade_AccumulationFund_Discount 1.0

#pragma mark -
#pragma mark 组合贷款页面

//**分区1的几个数据显示**//
#define Combination_Section_1_DataSourceArray @"公积金贷款金额(万元)",@"公积金贷款利率(%)",@"商业贷款金额(万元)",@"商业贷款利率(%)",@"商业贷款利率折扣(倍数)",@"贷款期限(年)",@"还款日期(年月)",@"还款方式"

//**分区1的几个数据显示**//
#define Combination_Section_2_DataSourceArray @"商业贷款利率(%)",@"累计支付利息(元)",@"累计还款总额"

#pragma mark -
#pragma mark 设置页面

//**页面的版本信息**//
#define Set_VersionInformation @"1.0.0.0"

@interface Common : NSObject


@end
