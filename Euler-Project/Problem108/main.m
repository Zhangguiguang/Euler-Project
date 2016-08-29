//
//  main.m
//  Problem108
//
//  Created by 张贵广 on 16/8/29.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 在如下方程中，x、y、n均为正整数。
 1/x + 1/y = 1/n
 
 对于n = 4，上述方程恰好有3个不同的解：
 1/5 + 1/20 = 1/4
 1/6 + 1/12 = 1/4
 1/8 + 1/8 = 1/4
 使得不同的解的数目超过1000的最小n值是多少？
 注意：这个问题是第110题的简单版本；强烈推荐先解决这一题。
 */
/*
 假设x已知， x ∈ (n, 2n],
 根据等式，很容易得出， y = xn/(x-n)， y ∈ (2n, +∞)
 
 所以，只需要对x从正整数n遍历到2n, 计算出有多少个正整数y, 即表示有多少个不同解
 
 这个方法十分低效。。。
 2016-08-29 17:15:34.359 Problem108[7761:159294] start
 n = 180180, solution = 1013
 2016-08-29 17:18:29.650 Problem108[7761:159294] end
 */

#import <Foundation/Foundation.h>
#define DIFFERENT_SOLUTION 1000

BOOL isPrimeNumber(long num) {
    if (num<=1) {
        return NO;
    }
    long end = sqrt(num);
    for (long i=2; i<=end; i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long n = 1000; // 要有超过1000种不同解， 首先 2n-n >= 1000
        long x = 0;
        long xn  = 0;
        long x_n = 0;
        int solutionCount = 0;
        
        NSLog(@"start");
        while (1) {
            if (isPrimeNumber(n)) {
                n++;
                continue;
            }
            solutionCount = 0;
            xn  = n * n;
            x_n = 0;
            for (x=n+1; x<=2*n; x++) {
                xn += n;
                x_n++;
                if (xn % x_n == 0) {
                    solutionCount ++;
                }
            }
            if (solutionCount > DIFFERENT_SOLUTION) {
                break;
            }
            n ++;
        }
        printf("n = %ld, solution = %d\n", n, solutionCount);
        NSLog(@"end");
    }
    return 0;
}
