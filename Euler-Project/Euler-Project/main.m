//
//  main.m
//  Euler-Project
//
//  Created by 张贵广 on 8/1/16.
//  Copyright © 2016 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

// 判断素数
BOOL isPrimeNumber(long num) {
    long end = sqrt(num);
    for (long i=2; i<=end; i++) {
        if (num%i == 0) {
            return 0;
        }
    }
    return 1;
}

// 计算一个数的真约数（不包含本身）之和
int sumOfProperDivisors(int num) {
    int sum = 1;
    int mid = sqrt(num);
    for (int i=2; i<=mid; i++) {
        if (num%i == 0) {
            sum += i;
            if (i != num/i) {
                sum += num/i;
            }
        }
    }
//    NSLog(@"sumOfProperDivisors(%d) = %d", num, sum);
    return sum;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 这里存一些经常会用的方法

    }
    return 0;
}
