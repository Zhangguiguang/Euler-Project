//
//  main.m
//  Problem156
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 数字计数
 http://pe-cn.github.io/156/
 */

/*
 经过测试
 f(1111111110, 1) = 1111111110
 而此时，s(1)=22786974071，符合题目给出的条件
 那么估计，要计算 1 ≤ d ≤ 9，∑ s(d)
 计算的终点大概可能是 1111111110 * 9 = 100亿
 ... 计算机吃不消了。
 
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 10000000000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long digitCount[10] = {0};
        long s[10] = {0};
    
        for (long i=1; i<MAX_LENGTH; i++) {
            long num = i;
            while (num > 0) {
                digitCount[num%10]++;
                num /= 10;
            }
            for (int j=1; j<10; j++) {
                if (digitCount[j] == i) {
                    NSLog(@"f(%ld, %d) = %ld", i, j, i);
                    s[j] += i;
                }
            }
        }
        
        long sum = 0;
        for (int i=1; i<10; i++) {
            sum += s[i];
            NSLog(@"s(%d) = %ld", i, s[i]);
        }
        
        NSLog(@"sum = %ld", sum);
        
    }
    return 0;
}
