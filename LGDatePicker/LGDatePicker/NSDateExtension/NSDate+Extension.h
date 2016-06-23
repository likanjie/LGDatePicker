//
//  NSDate+Extension.h
//  QIQIshangjia
//
//  Created by label on 15/11/6.
//  Copyright © 2015年 DM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *   格式化时间
 *
 *  @param date       要格式化的时间
 *  @param dateFormat 时间格式
 */
+(NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat;


+(NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat;
@end
