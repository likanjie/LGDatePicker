//
//  NSDate+Extension.m
//  QIQIshangjia
//
//  Created by label on 15/11/6.
//  Copyright © 2015年 DM. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *   格式化时间
 *
 *  @param date       要格式化的时间
 *  @param dateFormat 时间格式
 */
+(NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:date];
}

+(NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter dateFromString:dateString];
}
@end
