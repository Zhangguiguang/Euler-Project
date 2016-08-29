//
//  main.m
//  Problem058
//
//  Created by 张贵广 on 16/8/24.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 螺旋素数
 从1开始逆时针螺旋着摆放自然数，我们可以构造出一个边长为7的螺旋数阵。
         37 36 35 34 33 32 31
         38 17 16 15 14 13 30
         39 18  5  4  3 12 29
         40 19  6  1  2 11 28
         41 20  7  8  9 10 27
         42 21 22 23 24 25 26
         43 44 45 46 47 48 49
 可以发现，所有的奇数平方都在这个螺旋方针的右下对角线上，更有趣的是，在所有对角线上一共有8个素数，比例达到8/13 ≈ 62%。
 
 在这个方阵外面完整地再加上一层，就能构造出一个边长为9的螺旋方阵。如果不断重复这个过程，当对角线上素数的比例第一次低于10%时，螺旋数阵的边长是多少？
 */

/*
 从n阶方阵开始，要变成n+2阶方阵，需要有如下的步骤（右下角的数字num=n^2）
 1. 在方阵右边加上n+1个数，num+=n+1 是一个对角线数
 2. 在方阵上边加上n+1个数，num+=n+1 是一个对角线数
 3. 在方阵左边加上n+1个数，num+=n+1 是一个对角线数
 4. 在方阵下边加上n+1个数，num+=n+1 是一个对角线数
 所以这个问题很简单了。
 
 side = 26241
 */


#import <Foundation/Foundation.h>

// 判断素数
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
        int side = 1; // 方阵的阶数
        int num = 1; // 当前方阵的最大数
        int diagonalDigitalCount = 1; // 1是一个对角线数
        int primeDigitalCount = 0; // 对角线上的素数
        
        while (1) {
            side++;
            for (int i=0; i<4; i++) {
                num += side;
                diagonalDigitalCount ++;
                if (isPrimeNumber(num)) {
                    primeDigitalCount ++;
                }
            }
            side++;
            if ((primeDigitalCount * 1.0 / diagonalDigitalCount) < 0.10) {
                NSLog(@"side = %d", side);
                break;
            }
        }
    }
    return 0;
}
