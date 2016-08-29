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
 n = 180180, solution = 1013
 */

#import <Foundation/Foundation.h>
#define DIFFERENT_SOLUTION 1000

BOOL hasSolution(long x, long n) {
    long xn  = x * n;
    long x_n = x - n;
    if (xn % x_n == 0) {
        return YES;
    }
    return NO;
}

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
        int solutionCount = 0;
        
        while (1) {
            if (isPrimeNumber(n)) {
                n++;
                continue;
            }
            solutionCount = 0;
            for (long x=n+1; x<=2*n; x++) {
                if (hasSolution(x, n)) {
                    solutionCount ++;
                }
            }
            if (solutionCount > DIFFERENT_SOLUTION) {
                break;
            }
            n ++;
        }
        printf("n = %ld, solution = %d\n", n, solutionCount);
    }
    return 0;
}
