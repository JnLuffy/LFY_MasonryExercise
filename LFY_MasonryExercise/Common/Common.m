//
//  Common.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/21.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Common.h"

@implementation Common

// 重复text字符串repeat次
+ (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}

@end
