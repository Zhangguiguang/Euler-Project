//
//  main.m
//  Problem034
//
//  Created by 张贵广 on 16/8/2.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 各位数字的阶乘
 145是个有趣的数，因为1! + 4! + 5! = 1 + 24 + 120 = 145。
 找出所有各位数字的阶乘和等于其本身的数，并求它们的和。
 注意：因为1! = 1和2! = 2不是和的形式，所以它们并不在讨论范围内。
 */

/*
 按照题目的意思，n>=10
 当数字太过庞大时，必然有阶乘之和追不上原数。
 9! = 362880, 一个全9的阶乘之和最有希望追上原数，
 10位全9的阶乘和不过 3628800 7位数
 而7位全9的阶乘和 = 2,540,160
 因此 10 <= n <= 2600000
 
 计算中一定会获取很多次单位数阶乘，我们只需事先计算好1-9的阶乘，之后需要使用时直接获取。
 
 result = 40730
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int factorial[10] = {1};
        for (int i=1; i<10; i++) {
            factorial[i] = i * factorial[i-1];
        }
        
        for (int i=0; i<10; i++) {
            NSLog(@"%d - %d", i, factorial[i]);
        }
        
        int result = 0;
        for (int i=10; i<2600000; i++) {
            int num = i;
            int sum = 0;
            while (num > 0) {
                sum += factorial[num%10];
                num /= 10;
            }
            if (sum == i) {
                result += i;
                NSLog(@"num = %d", i);
            }
        }
        
        NSLog(@"result = %d", result);
    }
    return 0;
}
