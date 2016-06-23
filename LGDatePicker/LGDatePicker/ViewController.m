//
//  ViewController.m
//  LGDatePicker
//
//  Created by 李堪阶 on 16/6/23.
//  Copyright © 2016年 DM. All rights reserved.
//

#import "ViewController.h"
#import "LGDatePicker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LGDatePicker *datePicker = [[LGDatePicker alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    
    [self.view addSubview:datePicker];
    
    
    NSString *year = [datePicker selectedRowInComponent:0];
    
    NSString *month = [datePicker selectedRowInComponent:1];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 330, 150, 30)];
    
    label.text = [NSString stringWithFormat:@"%@-%@",year,month];
    
    label.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:label];
    
    
    datePicker.datePickBlock = ^(NSString *year,NSString *month){
        
        label.text = [NSString stringWithFormat:@"%@-%@",year,month];
    };

}

@end
