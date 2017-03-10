//
//  UITableView+UITableVIew_UITouch.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/25.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "UITableView+UITableVIew_UITouch.h"

@implementation UITableView (UITableVIew_UITouch)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}
@end
