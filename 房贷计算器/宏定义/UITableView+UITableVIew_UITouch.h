//
//  UITableView+UITableVIew_UITouch.h
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/25.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (UITableVIew_UITouch)
//**当页面添加了tableView时，其点击手势直接调用无法响应，此TableView分类里的三个事件，相当于重写点击手势事件**//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
