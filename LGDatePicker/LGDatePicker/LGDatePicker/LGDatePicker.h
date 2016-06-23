//
//  WorkTimeView.h
//  年月选择器
//
//  Created by 李堪阶 on 16/6/17.
//  Copyright © 2016年 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGDatePicker : UIView

typedef void (^DatePickerBlock) (NSString *,NSString *);

@property (copy ,nonatomic) DatePickerBlock datePickBlock;

/**
 *  返回选择当前列的当前行的字符
 */
- (NSString *)selectedRowInComponent:(NSInteger)component;

@end
