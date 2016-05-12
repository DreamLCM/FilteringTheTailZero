//
//  main.m
//  FilteringTheTailZero
//
//  Created by MAC on 16/5/12.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filtering.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSString * str = [Filtering stringWithFilteringTheTailZero:@"1.202030300"];
        NSLog(@"%@",str);
        
    }
    return 0;
}
