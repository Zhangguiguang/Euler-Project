//
//  main.m
//  Problem087
//
//  Created by 张贵广 on 2018/7/28.
//  Copyright © 2018年 GG. All rights reserved.
//

/*
 素数幂三元组
 
 最小的可以表示为一个素数的平方，加上一个素数的立方，再加上一个素数的四次方的数是28。实际上，在小于50的数中，一共有4个数满足这一性质：
 
 28 = 2^2 + 2^3 + 2^4
 33 = 3^2 + 2^3 + 2^4
 49 = 5^2 + 2^3 + 2^4
 47 = 2^2 + 3^3 + 2^4
 
 有多少个小于五千万的数，可以表示为一个素数的平方，加上一个素数的立方，再加上一个素数的四次方？
 */

/*
 f(x, y, z) = x^2 + y^3 + z^4 (x,y,z | 为素数)
 
 假设
 f(x, y, z) < 50,000,000, 则 x, y, z必有界，必然小于某一个值
 
 很明显，当y = 2, z = 2, x 可取到最大值，此为需要找到素数的范围
 经过第一轮计算，可得知 x, y, z 的取值范围为 {2, 3, 5, ... 7057, 7069} 这908个素数
 
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
        
        int maxSum = 50000000;
        
        int containMaxPrimeNumber = maxSum - pow(2, 3) - pow(2, 4);
        
        NSMutableArray *primeArray = [NSMutableArray arrayWithCapacity:1000];
        [primeArray addObject:@(2)];
        int maxPrime = 3;
        while (maxPrime * maxPrime <= containMaxPrimeNumber) {
            if (isPrimeNumber(maxPrime)) {
                NSLog(@"%d", maxPrime);
                [primeArray addObject:@(maxPrime)];
            }
            maxPrime += 2;
        }
        
        
        
    }
    return 0;
}


