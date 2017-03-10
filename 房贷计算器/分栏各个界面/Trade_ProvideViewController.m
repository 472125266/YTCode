//
//  Trade_ProvideViewController.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "Trade_ProvideViewController.h"

@interface Trade_ProvideViewController ()

@end

@implementation Trade_ProvideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self Trade_InitViewNeedThing];
}
#pragma mark -
#pragma mark 初始化数据
-(void)Trade_InitViewNeedThing{
    self.navigationItem.title = @"商业贷款";
    _Section_1DataSource = [[NSMutableArray alloc]initWithObjects:Trade_Section_1_DataSourceArray, nil];
    _Section_2DataSource = [[NSMutableArray alloc]initWithObjects:Trade_Section_2_DataSourceArray, nil];
    _Section_3DataSource = [[NSMutableArray alloc]init];
    _Section_3DataSource_Date = [[NSMutableArray alloc]init];
    //日期选择器的初始化
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,Commonality_DatePicker_Width,Commonality_DatePicker_High)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.backgroundColor = [UIColor colorWithRed:209.f/255.f green:213.f/255.f blue:219.f/255.f alpha:1.f];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    //设置日期选择器默认显示的日期
    [dateFormater setDateFormat:@"yyyy-MM-dd"];
    //获取当前时间，日期
    NSDate *currentDate = [NSDate date];
    _datePicker.date = currentDate;
    //下面两条命令主要防止Date数据不改变时，Date数据不会变，系统也不会崩溃
    _chanceDate = currentDate;
    _OtherchanceDate = currentDate;
    _strDate = [self FormatNsdate:_datePicker.date];
    [_datePicker addTarget:self action:@selector(DatePickerSelect:) forControlEvents:UIControlEventValueChanged];
    //TableView的代理设置
    _Trade_tableView.delegate = self;
    _Trade_tableView.dataSource = self;
    //商业默认利率为4.90%
    _LoanInterest = Trade_AccumulationFund_Default;
    _InterestRateDiscount = Trade_AccumulationFund_Discount;
}
#pragma mark -
#pragma mark TableView的几个代理事件
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger tempSectionNum;
    switch (section) {
        case 0:
            tempSectionNum = _Section_1DataSource.count;
            break;
        case 1:
            tempSectionNum = _Section_2_Number;
            break;
        case 2:
            tempSectionNum = _Section_3_Number;
            break;
        default:
            break;
    }
    return tempSectionNum;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCell = @"Trade_Cell";
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:strCell];
    if (cell == nil) {
        if(indexPath.section == 0) {
            if (indexPath.row<5) {
                cell = [self CustomSection_1_HaveTextField:indexPath.row Cell:cell];
            }
            else{
                cell = [[[NSBundle mainBundle]loadNibNamed:@"Refund_PublicTableViewCell" owner:self options:nil] lastObject];
                Refund_PublicTableViewCell *PublicCell = (Refund_PublicTableViewCell *)cell;
                _sSegmentedControl =  [PublicCell TellCPF_VcUISegmentedControl:_NowIsInterestOrCapital];
                [_sSegmentedControl addTarget:self action:@selector(SegmentControlChange:) forControlEvents:UIControlEventValueChanged];
            }
        }
        if(indexPath.section == 1) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CPF_Custom_1TableViewCell" owner:self options:nil] lastObject];
            CPF_Custom_1TableViewCell *customCell = (CPF_Custom_1TableViewCell *)cell;
            NSString *Customstring = [_Section_2DataSource objectAtIndex:indexPath.row];
            NSString *strTemp = nil;
            if(indexPath.row == 0){
                strTemp = [NSString stringWithFormat:@"%.2f",(_LoanInterest * _InterestRateDiscount)];
            }
            else if (indexPath.row == 1) {
                strTemp = _PayInterest;
            }
            else{
                strTemp = _PayRental;
            }
            [customCell updatashowlabelInterest:Customstring Money:strTemp];
        }
        if(indexPath.section == 2) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CPF_Custom_1TableViewCell" owner:self options:nil] lastObject];
            CPF_Custom_1TableViewCell *customCell1 = (CPF_Custom_1TableViewCell *)cell;
            if(indexPath.row == 0){
                [customCell1 updatashowlabelInterest:_showSection_3_Row_1 Money:[NSString stringWithFormat:@"%.2f",_EveryMonthMoney]];
            }
            else if(indexPath.row == 1){
                [customCell1 updatashowlabelInterest:@"期数" Money:_showSection_3_Row_2];
            }
            else{
                NSString *strTempData = [_Section_3DataSource objectAtIndex:indexPath.row-2];
                NSString *strTempDate = [_Section_3DataSource_Date objectAtIndex:indexPath.row-2];
                [customCell1 updatashowlabelInterest:strTempDate Money:strTempData];
            }
        }
    }
    return cell;
}
#pragma mark 分区一数据订制带TextField 方法分解
-(UITableViewCell *)CustomSection_1_HaveTextField:(NSInteger)indexPathRow Cell:(UITableViewCell *)cell{
    cell = [[[NSBundle mainBundle]loadNibNamed:@"PublicTableViewCell" owner:self options:nil] lastObject];
    NSString *Publicstring =  [_Section_1DataSource objectAtIndex:indexPathRow];
    NSInteger tempTag = 1000+indexPathRow;
    PublicTableViewCell *PublicCell = (PublicTableViewCell *)cell;
    NSString *tempStr2;
    if (indexPathRow == 0) {
        tempStr2 = [NSString stringWithFormat:@"%.2f",_LoanMoney];
        _textField_1 = [PublicCell updataPublicTableViewCell:Publicstring str2:tempStr2];
        _textField_1.delegate = self;
        _textField_1.tag = tempTag;
        //添加提示视图,和系统键盘一块显示
        _textField_1.inputAccessoryView=[self addCustomKeyboard];
    }
    else if (indexPathRow == 1){
        tempStr2 = [NSString stringWithFormat:@"%ld",_LoanDeadline];
        _textField_2 = [PublicCell updataPublicTableViewCell:Publicstring str2:tempStr2];
        _textField_2.delegate = self;
        _textField_2.tag = tempTag;
        _textField_2.inputAccessoryView=[self addCustomKeyboard];
    }else if (indexPathRow == 2){
        tempStr2 = _strDate;
        _textField_3 = [PublicCell updataPublicTableViewCell:Publicstring str2:tempStr2];
        _textField_3.delegate = self;
        _textField_3.tag = tempTag;
        _textField_3.inputAccessoryView=[self addCustomKeyboard];
    }else if (indexPathRow == 3){
        tempStr2 = [NSString stringWithFormat:@"%.2f",_LoanInterest];
        _textField_4 = [PublicCell updataPublicTableViewCell:Publicstring str2:tempStr2];
        _textField_4.delegate = self;
        _textField_4.tag = tempTag;
        _textField_4.inputAccessoryView=[self addCustomKeyboard];
    }else{
        tempStr2 = [NSString stringWithFormat:@"%.1f",_InterestRateDiscount];
        _textField_5 = [PublicCell updataPublicTableViewCell:Publicstring str2:tempStr2];
        _textField_5.delegate = self;
        _textField_5.tag = tempTag;
        _textField_5.inputAccessoryView=[self addCustomKeyboard];
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
#pragma mark 软件盘上的订制的TopView
-(UIView *) addCustomKeyboard{
    UIView *vView1=[[UIView alloc] init];
    //自定义键盘 宽度不能更改，高度可以，一般把宽度设为屏幕的宽度，
    vView1.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    vView1.backgroundColor = [UIColor colorWithRed:209.f/255.f green:213.f/255.f blue:219.f/255.f alpha:1.f];
    UIButton *_buttonNext = [[UIButton alloc]initWithFrame:CGRectMake(20, 2,60, 40)];
    [_buttonNext setTitle:@"上一项" forState:UIControlStateNormal];
    [_buttonNext addTarget:self action:@selector(ChangeNext:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *_buttonPrevious = [[UIButton alloc]initWithFrame:CGRectMake(81, 2,61, 40)];
    [_buttonPrevious setTitle:@"下一项" forState:UIControlStateNormal];
    [_buttonPrevious addTarget:self action:@selector(ChangePrevious:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-140, 2,50, 40)];
    [button1 setTitle:@"重置" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(changeValueIsNull:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-70, 2,50, 40)];
    [button2 setTitle:@"计算" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(changeValueIsCalcute:) forControlEvents:UIControlEventTouchUpInside];
    
    [vView1 addSubview:_buttonNext];
    [vView1 addSubview:_buttonPrevious];
    [vView1 addSubview:button1];
    [vView1 addSubview:button2];
    return vView1;
}
#pragma mark -
#pragma mark 软件盘上的TopView上按钮的几个事件
#pragma mark 软件盘上的上一项
-(void) ChangeNext:(id) sender{
    if (_NowIsTextFieldLocation != 1000 && _NowIsTextFieldLocation <= 1004) {
        _NowIsTextFieldLocation--;
        UITextField *textField = [self.view viewWithTag:_NowIsTextFieldLocation];
        [textField becomeFirstResponder];
    }
}
#pragma mark 软件盘上的下一项
-(void) ChangePrevious:(id) sender{
    if (_NowIsTextFieldLocation != 1004 && _NowIsTextFieldLocation >= 1000) {
        _NowIsTextFieldLocation++;
        UITextField *textField = [self.view viewWithTag:_NowIsTextFieldLocation];
        [textField becomeFirstResponder];
    }
}
#pragma mark 重置按钮事件
-(void)changeValueIsNull:(id)sender{
    //需要把数据重新设置一下(此处数据和TextField都置为空，是为了有时候怕数据清空重置不干净)
    _textField_1.text = @"";
    _textField_2.text = @"";
    _textField_4.text = @"4.90";
    _textField_5.text = @"1.0";
    _LoanMoney = 0;
    _LoanDeadline = 0;
    _LoanInterest = 4.9;
    _InterestRateDiscount = 1.0;
    //获取当前时间，日期
    NSDate *currentDate = [NSDate date];
    _strDate = [self FormatNsdate:currentDate];
    //分段控制器为最左边
    _NowIsInterestOrCapital = 0;
    _Section_2_Number = 0;
    _Section_3_Number = 0;
    [self chanceTableViewTopLayoutRangeNormal];
    [_Trade_tableView reloadData];
}
#pragma mark 计算结果事件
-(void)changeValueIsCalcute:(id)sender{
    [self.view endEditing:YES];
    [self chanceTableViewTopLayoutRangeNormal];
        if (_LoanDeadline>0&&_LoanMoney>0&&_LoanInterest>0&&_InterestRateDiscount>0&&_strDate!=nil) {
            _Section_2_Number = 3;
            _Section_3_Number = _LoanDeadline* 12 + 2;
            _surplusMoney = _LoanMoney * 10000;
            _EveryMonthDouble = ( _LoanInterest / 100 / 12 ) * _InterestRateDiscount;
            [_Section_3DataSource removeAllObjects];
        [self CalculationOfEvent];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_Trade_tableView reloadData];
            _isHaveValue = YES;
        });
    }
}
#pragma mark -
#pragma mark 计算按钮事件1(等额本息)
-(void)averageCapitalPlusInterest{
    _showSection_3_Row_1 = @"每期还款(元)";
    _showSection_3_Row_2 = @"本金/利息";
    NSInteger tempData  = _LoanDeadline * 12;
    double tempLoan = pow( 1 + _EveryMonthDouble, tempData);
    //每月还款已定
    _EveryMonthMoney = (_LoanMoney* 10000) * _EveryMonthDouble * tempLoan / (tempLoan-1);
    //还款总额
    double _TotalMoney = _EveryMonthMoney * tempData;
    //累计还款总额
    _PayRental = [NSString stringWithFormat:@"%.2f",_TotalMoney];
    //累计支付利息
    _PayInterest = [NSString stringWithFormat:@"%.2f",(_TotalMoney - _LoanMoney * 10000)];
    for (NSInteger i = 0; i < tempData; i++) {
        //每月利息
        _EveryLoanInterest  = _surplusMoney * _EveryMonthDouble;
        //各期还的本金
        _EveryMonthInterest   = _EveryMonthMoney - _EveryLoanInterest;
        //剩余本金
        _surplusMoney = _surplusMoney - _EveryMonthInterest;
        NSString *strTemp = [NSString stringWithFormat:@"%.2f/%.2f",_EveryMonthInterest,_EveryLoanInterest];
        [_Section_3DataSource addObject:strTemp];
    }
    //将事件放入到一个数组里
    [self timeDisposalAction];
}
#pragma mark 计算按钮事件2(等额本金)
-(void)averageCapital{
    _showSection_3_Row_1 = @"每期本金(元)";
    _showSection_3_Row_2 = @"还款/利息";
    //**支付利息**//
    double _TotalInterest = 0;
    double tempData  = _LoanDeadline * 12;
    //每月还款本金已定
    _EveryMonthMoney =  _LoanMoney * 10000 / tempData;
    for (NSInteger i = 0; i < tempData; i++) {
        //每月利息
        _EveryLoanInterest = _surplusMoney * _EveryMonthDouble;
        //每期还款
        _EveryMonthInterest = _EveryLoanInterest + _EveryMonthMoney;
        //剩余本金
        _surplusMoney =_surplusMoney -  _EveryMonthMoney ;
        //还的总利息
        _TotalInterest = _TotalInterest + _EveryLoanInterest;
        
        NSString *strTemp = [NSString stringWithFormat:@"%.2f/%.2f",_EveryMonthInterest,_EveryLoanInterest];
        [_Section_3DataSource addObject:strTemp];
    }
    //累计支付利息
    _PayInterest = [NSString stringWithFormat:@"%.2f",_TotalInterest];
    //累计还款总额
    _PayRental = [NSString stringWithFormat:@"%.2f",(_TotalInterest+_LoanMoney * 10000)];
    //将事件放入到一个数组里
    [self timeDisposalAction];
}
#pragma mark -
#pragma mark Textfield的几个代理事件
#pragma mark 此方法可用于判断光标位置, 然后记录现在是在哪个TextField，并记录其值
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _textField_1) {
        _NowIsTextFieldLocation = 1000;
    }
    else if (textField == _textField_2){
        _NowIsTextFieldLocation = 1001;
    }
    else if (textField == _textField_3){
        _NowIsTextFieldLocation = 1002;
    }
    else if(textField == _textField_4){
        _NowIsTextFieldLocation = 1003;
    }else if(textField == _textField_5){
        _NowIsTextFieldLocation = 1004;
    }
    [self chanceTableViewTopLayoutRangeBeginNotFirst];
}
#pragma mark 当键盘收起时，记录其TextField里输入的内容
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _textField_1) {
        _LoanMoney = textField.text.doubleValue;
    }
    else if (textField == _textField_2){
        _LoanDeadline = textField.text.integerValue;
    }
    else if(textField == _textField_4){
        _LoanInterest = textField.text.doubleValue;
    }
    else if (textField == _textField_5){
        _InterestRateDiscount = textField.text.doubleValue;
    }
}
#pragma mark 当某个TextField将要显示并实现的时候调用，主要为了判断当是日期选择器那个TextField时，显示日期选择器
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (_textField_3 == textField) {
        _textField_3.inputView = _datePicker;
    }
    return  YES;
}
#pragma mark -
#pragma mark 单元格显示的分段控制器的事件(即是记录等额本息还是等额本金/或当已经计算一遍之后，再次选择分段控制器时，也会调用计算方法)
-(void) SegmentControlChange:(id) sender{
    UISegmentedControl *sSegControl=(UISegmentedControl *)sender;
    _NowIsInterestOrCapital = sSegControl.selectedSegmentIndex;
    if (_isHaveValue) {
        _surplusMoney = _LoanMoney * 10000;
        _EveryMonthDouble = ( _LoanInterest / 100 / 12 ) * _InterestRateDiscount;
        [_Section_3DataSource removeAllObjects];
        _chanceDate = _OtherchanceDate;
        [self CalculationOfEvent];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_Trade_tableView reloadData];
        });
    }
}
#pragma mark 计算事件提取
-(void)CalculationOfEvent{
    if (_NowIsInterestOrCapital == 0) {
        //等额本息
        [self averageCapitalPlusInterest];
    }
    else{
        //等额本金
        [self averageCapital];
    }
}
#pragma mark -
#pragma mark 当页面显示不下时，其TableView顶部向上/下的移动(即是顶部的AutoLayout的改变)
-(void)chanceTableViewTopLayoutRangeBeginNotFirst{
    if (Commonality_OpenQuipment_iPhone_4s) {
        NSInteger tempTextFieldLocation = _NowIsTextFieldLocation - 1000;
        if (tempTextFieldLocation == 4) {
            [self SetTheAnimation:(tempTextFieldLocation + 0.5) * Commonality_TableView_SectionRowHigh];
        }
        else if (tempTextFieldLocation > 0 ) {
            [self SetTheAnimation:tempTextFieldLocation * Commonality_TableView_SectionRowHigh];
        }
        else{
            [self chanceTableViewTopLayoutRangeNormal];
        }
    }
    else if (Commonality_OpenQuipment_iPhone_5_5s) {
        NSInteger tempTextFieldLocation = _NowIsTextFieldLocation - 1000;

        if (tempTextFieldLocation >= 2) {
            [self SetTheAnimation:Commonality_TableView_SectionRowHigh * tempTextFieldLocation];
        }
        else{
            [self chanceTableViewTopLayoutRangeNormal];

        }
    }
    else if (Commonality_OpenQuipment_iPhone_6_6s){
    NSInteger tempTextFieldLocation = _NowIsTextFieldLocation - 1000;
        if (tempTextFieldLocation == 4) {
             [self SetTheAnimation:Commonality_TableView_SectionRowHigh * 2];
        }
        else if (tempTextFieldLocation == 2){
            [self chanceTableViewTopLayoutRangeNormal];
        }
    }
    else if (Commonality_OpenQuipment_iPhone_6Plus_6sPlus){
        NSInteger tempTextFieldLocation = _NowIsTextFieldLocation - 1000;
        if (tempTextFieldLocation == 4) {
            [self SetTheAnimation:Commonality_TableView_SectionRowHigh];
        }
    }
}
#pragma mark 当TextField回归正常时，其TableView顶部回归正常
-(void)chanceTableViewTopLayoutRangeNormal{
    [self SetTheAnimation:0];
}
#pragma mark 设置动画效果
-(void)SetTheAnimation:(NSInteger)chanceLayoutValue{
    //步骤1.动画开始
    [UIView beginAnimations:nil context:nil];
    //步骤2.给动画设置当前代理为当前类
    [UIView setAnimationDelegate:self];
    //步骤3.设置动画开始时响应的方法
    [UIView setAnimationWillStartSelector:@selector(animationDidStart:)];
    //步骤4.设置动画结束时响应的方法
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    //步骤5.设置动画的延迟时间
    [UIView setAnimationDelay:0.0f];
    //步骤6.设置动画的持续时间
    [UIView setAnimationDuration:1.f];
    //动画重复次数
    [UIView setAnimationRepeatCount:0];
    //反转:把视图在动画持续显示的时候反过来显示
    [UIView setAnimationRepeatAutoreverses:YES];
    //             //设置视图的透明度
    _Trade_TableView_TopLayoutRange.constant = - chanceLayoutValue;
    //步骤7.提交动画，所有的动画配置设置完毕后，调用此方法，动画开始执行
    [UIView commitAnimations];
    
}
#pragma mark -
#pragma mark 选择日期选择器上的日期之后，将日期显示到这一单元格的TextField
-(void) DatePickerSelect:(UIDatePicker *) dPicker{
    _chanceDate=dPicker.date;
    _OtherchanceDate = dPicker.date;
    _strDate=[self FormatNsdate:_chanceDate];
    _textField_3.text = _strDate ;
}
#pragma mark 时间处理事件(单元格上显示的日期数据)
-(void)timeDisposalAction{
    [_Section_3DataSource_Date removeAllObjects];
    NSInteger tempMonthNum = _LoanDeadline * 12;
    _chanceDate = _OtherchanceDate;
    for (NSInteger i = 0; i < tempMonthNum; i++) {
        NSCalendar *calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = nil;
        comps = [calender components:NSCalendarUnitMonth fromDate:_chanceDate];
        NSDateComponents *adcomps = [[NSDateComponents alloc]init];
        if(i==0){
            //第一个月直接算在内
            [adcomps setMonth:+0];
        }else{
            //其它月数+1
            [adcomps setMonth:+1];
        }
        _chanceDate = [calender dateByAddingComponents:adcomps toDate:_chanceDate options:0];
        NSString *strData = [self FormatNsdateShowCell:_chanceDate];
        [_Section_3DataSource_Date addObject:[NSString stringWithFormat:@"第%ld期[%@]",i+1,strData]];
    }
}
#pragma mark 格式化NSDate对象,单元格显示每一期调用
-(NSString *)FormatNsdateShowCell:(NSDate*)Date{
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    //NSDate转NSString
    return [dateFormatter stringFromDate:Date];
}
#pragma mark 格式化NSDate对象，页面TextField显示日期调用
-(NSString *)FormatNsdate:(NSDate*)Date{
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate转NSString
    return [dateFormatter stringFromDate:Date];
}
#pragma mark -
#pragma mark 点击页面，其软件盘消失的点击事件
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITextField *tempfield = [self.view viewWithTag:_NowIsTextFieldLocation];
    [tempfield resignFirstResponder];
    [self chanceTableViewTopLayoutRangeNormal];
}
#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
