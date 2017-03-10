//
//  Set_ViewController.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "Set_ViewController.h"

@interface Set_ViewController ()

@end

@implementation Set_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //数据初始化
    [self Set_InitViewNeedThing];
}
#pragma mark 设置页面
-(void)Set_InitViewNeedThing{
    self.navigationItem.title = @"设置";
    _Set_tableView.delegate = self;
    _Set_tableView.dataSource = self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCellID = @"Set_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CPF_Custom_1TableViewCell" owner:self options:nil]lastObject];
        CPF_Custom_1TableViewCell *cCell = (CPF_Custom_1TableViewCell *)cell;
        [cCell updatashowlabelInterest:@"关于版本" Money:Set_VersionInformation];
    }
    return cell;
}
#pragma mark -
#pragma mark 设置单元格高度的几个事件
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Commonality_TableView_SectionRowHigh;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Commonality_TableView_SectionHeadHigh;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return Commonality_TableView_SectionFootHigh;
}
#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
