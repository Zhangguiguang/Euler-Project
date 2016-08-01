//
//  main.m
//  Problem010
//
//  Created by 张贵广 on 15/9/18.
//  Copyright (c) 2015年 HZNU. All rights reserved.
//
/*
 
 素数的和
 
 所有小于10的素数的和是2 + 3 + 5 + 7 = 17。
 
 求所有小于两百万的素数的和。
 
 // 这个没什么好说的
 // 答案 last sum = 142913828922
 // 从NSLog的输出时间来看，这个程序运行了7分钟才出来。。
 
 // 我对j的取值范围为 2 <= j <= i/2，
 // 网上有算法，用2 <= j <= sqrt(i)来作为j的范围
 // 运算结果 刷刷刷，1秒不到，就计算出来了。。。。。
 
 */

#import <Foundation/Foundation.h>
#define MAX_NUM 2000000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // (2000000+1)/2*2000000，考虑素数只有一半，素数和也许有10000 0000 0000
        long sum = 0;
        int isPrime = 1;
        for (int i = 2; i < MAX_NUM; i++) {
            isPrime = 1;
            for (int j = 2; j*j <= i; j++) {
                if (i % j == 0) {
                    isPrime = 0;    // 如果一个数不是素数，就会在这里被设为0
                    break;
                }
            }
            if (isPrime) {
                sum += i;
            }
            
            // 下面这段if只是为了测试，怕程序中途有意外。
            if (i % 100000 == 0) {
                NSLog(@"--->%i", i);
                NSLog(@"sum = %li", sum);
            }
        }
        
        NSLog(@"last sum = %li", sum);
        
    }
    return 0;
}
