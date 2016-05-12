//
//  Filtering.m
//  FilteringTheTailZero
//
//  Created by MAC on 16/5/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "Filtering.h"

@implementation Filtering
/*
 过滤结尾多余的0
 */
+(NSString *)stringWithFilteringTheTailZero:(NSString *)originalStr{
    NSString * finalStr = [[NSString alloc] init];
    NSMutableArray * muArr = [[NSMutableArray alloc]init];
    NSMutableString * muStr = [[NSMutableString alloc] init];
    
    //        NSLog(@"%ld",[originalStr rangeOfString:@"."].location);
    
    
    /*
     * 获取字符串最后一位，如果为0
     */
    if ([[originalStr substringWithRange:NSMakeRange(originalStr.length-1, 1)] isEqualToString:@"0"]) {
        
        NSRange range = [originalStr rangeOfString:@"."];
        
        /*
         * 如果location 找不到 “.”,直接输出原字符串
         */
        if (range.location ==  NSNotFound) {
            
            finalStr = originalStr;
            //                NSLog(@"%@",_finalStr);
            return 0;
        }
        
        // 截取小数点后面所有的内容
        NSString * backStr = [originalStr substringFromIndex:range.location + 1];
        
        // 把截取得来的字符串放进数组
        for (int i = 0; i < backStr.length; i++) {
            [muArr addObject:[backStr substringWithRange:NSMakeRange(i, 1)]];
        }
        //            NSLog(@"%@",muArr);
        
        // 如果数组最后一位，删去，这里有一个缺陷，这里的循环次数写多20次，虽然不是很好，但是解决了数组元素减少到小于i时循环不执行
        for (int i = 0; i < [muArr count]+20; i++) {
            
            if ([muArr.lastObject isEqualToString:@"0"]) {
                
                [muArr removeLastObject];
                
            }
        }
        //            NSLog(@"%@",muArr);
        
        // 把删去零的数组插入到一个新的字符串
        for (int i = 0; i < [muArr count]; i++) {
            [muStr insertString:muArr[i] atIndex:i];
        }
        //            NSLog(@"%@",muStr);
        
        // 如果新的字符串长度为零，即原字符串小数点后面全为零的情况，输出小数点前的字符串
        if (muStr.length == 0) {
            NSString * firstStr = [originalStr substringToIndex:range.location];
            
            finalStr = firstStr;
            //                NSLog(@"%@",_finalStr);
            
            // 反之，以小数点拼接最终字符串
        }  else  {
            
            NSString * firstStr = [originalStr substringToIndex:range.location];
            
            finalStr = [NSString stringWithFormat:@"%@.%@",firstStr,muStr];
            
            //                NSLog(@"%@",_finalStr);
            
        }
        
        
        
        /*
         * 如果字符串最后一位不为零，直接输出原字符串
         */
    } else {
        finalStr = originalStr;
        //            NSLog(@"%@",_finalStr);
    }
    
    return finalStr;
    
}



@end
