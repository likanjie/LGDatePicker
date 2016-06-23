//
//  WorkTimeView.m
//  年月选择器
//
//  Created by 李堪阶 on 16/6/17.
//  Copyright © 2016年 DM. All rights reserved.
//

#import "LGDatePicker.h"
#import "NSDate+Extension.h"

@interface LGDatePicker ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong ,nonatomic) NSMutableArray *array;

@property (strong ,nonatomic) NSMutableArray *yearArray;

@property (strong ,nonatomic) NSMutableArray *monthArray;

@property (strong ,nonatomic) UIPickerView *picker;

@property (copy ,nonatomic) NSString *currenYearStr;

@property (copy ,nonatomic) NSString *yearStr;

@property (copy ,nonatomic) NSString *currenMonthStr;

@property (copy ,nonatomic) NSString *monthStr;

@property (copy ,nonatomic) NSString *yearTitle;
@property (copy ,nonatomic) NSString *monthTitle;
@property (assign ,nonatomic) int currenYear;
@property (assign ,nonatomic) int currenMonth;
@end

@implementation LGDatePicker

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self addData];
        [self setupUI];
    }
    return self;
}

- (void)addData{
    
    self.yearArray = [NSMutableArray array];
    
    //当前年str
    self.currenYearStr = [NSDate stringFromDate:[NSDate date] dateFormat:@"yyyy"];
    //当前年int
    self.currenYear = [self.currenYearStr intValue];
    
    //当前月str
    self.currenMonthStr = [NSDate stringFromDate:[NSDate date] dateFormat:@"MM"];
    //当前月int
    self.currenMonth = [self.currenMonthStr intValue];
    
    //添加年
    int year = 1969;
    
    for (int i = 0; i < 70; i++) {
        
        year += 1;
        
        [self.yearArray addObject:[NSString stringWithFormat:@"%d年",year]];
        
        if (year == self.currenYear) {
            
            self.currenYear = i;
        }
    }
    self.monthArray = [NSMutableArray array];
    
    //添加月
    int month = 0;
    
    for (int i = 0; i < 12; i++) {
        
        month += 1;
        
        if (i<9) {
            [_monthArray addObject:[NSString stringWithFormat:@"0%d月",month]];
        }else{
            [_monthArray addObject:[NSString stringWithFormat:@"%d月",month]];
        }
        
        if (month == self.currenMonth) {
            
            self.currenMonth = i;
        }
        
    }
    
    //添加年月
    self.array = [NSMutableArray array];
    
    [self.array addObject:self.yearArray];
    
    [self.array addObject:_monthArray];
}

- (void)setupUI{

    self.picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.picker.backgroundColor = [UIColor whiteColor];
    
    self.picker.delegate = self;
    
    self.picker.dataSource = self;
    
    [self addSubview:self.picker];
    
    //主动选择当前年月
    [self.picker selectRow:self.currenYear inComponent:0 animated:YES];
    [self.picker selectRow:self.currenMonth inComponent:1 animated:YES];
    
    
    self.yearTitle = [self.yearArray[self.currenYear] substringToIndex:4];
    self.monthTitle = [self.monthArray[self.currenMonth] substringToIndex:2];

}

/**
 *  返回选择当前列的当前行的字符
 */
- (NSString *)selectedRowInComponent:(NSInteger)component{
    
    NSInteger row = [self.picker selectedRowInComponent:component];
        
    return (component == 0) ? [self.yearArray[row] substringToIndex:4] :[self.monthArray[row] substringToIndex:2];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return self.array.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSArray *subArray = self.array[component];
    
    return subArray.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSArray *subArray = self.array[component];
    
    return subArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSArray *subArray = self.array[component];
    
    if (component == 0) { //年
        NSString *title = subArray[row];
        //年
        self.yearStr = [title substringToIndex:title.length - 1];
        self.yearTitle = self.yearStr;
        if ([self.currenYearStr intValue] <= [self.yearStr intValue]) {
            
            self.yearTitle = self.currenYearStr;
            
            [pickerView selectRow:self.currenYear inComponent:0 animated:YES];
            
            if ([self.currenMonthStr intValue] < [self.monthStr intValue]) {
                
                self.monthTitle = [self.monthArray[self.currenMonth] substringToIndex:2];
                
                [pickerView selectRow:self.currenMonth inComponent:1 animated:YES];
            }
        }
        
    }else{ //月
        
        NSString *title = subArray[row];
        //月
        self.monthStr = [title substringToIndex:title.length -1];
        self.monthTitle = self.monthStr;
        
        if ([self.currenYearStr intValue] == [self.yearTitle intValue] ) {
            
            if ([self.currenMonthStr intValue] < [self.monthStr intValue]) {
                
                self.monthTitle = self.currenMonthStr;
                [pickerView selectRow:self.currenMonth inComponent:component animated:YES];
            }
        }
        
    }
    
    NSLog(@"%@年%@月",self.yearTitle,self.monthTitle);
    
    if (_datePickBlock) {
        
        self.datePickBlock(self.yearTitle,self.monthTitle);
    }
}


@end
