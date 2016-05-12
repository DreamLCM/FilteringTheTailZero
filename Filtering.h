//
//  Filtering.h
//  FilteringTheTailZero
//
//  Created by MAC on 16/5/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filtering : NSObject
/*
 过滤结尾多余的0
 */
+(NSString *)stringWithFilteringTheTailZero:(NSString *)originalStr;

@end
