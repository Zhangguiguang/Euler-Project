//
//  main.m
//  Prolem003
//
//  Created by 张贵广 on 7/31/16.
//  Copyright © 2016 GG. All rights reserved.
//

/*
 最大质因数
 13195的所有质因数为5、7、13和29。
 600851475143最大的质因数是多少？
 */

/*
 n = 600851475143
 分解质因数
 质数prime从2，3，5，7。。。开始
 
 while (n不是质数 && prime<=num) {
 if (n%prime == 0) n /= prime;
 else prime = next prime;
 }
 result = max(prime, n);
 */

#import <Foundation/Foundation.h>

BOOL isPrimeNumber(long num) {
    long end = sqrt(num);
    for (long i=2; i<=end; i++) {
        if (num%i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long num = 600851475143;
        
        long prime = 3; // 很明显，最小质因数不会是2，它的质因数全部是奇数
        while (!isPrimeNumber(num) && prime<=num) {
            if (num % prime == 0) {
                num /= prime;
                printf("%ld, ", prime);
            }
            else {
                while (!isPrimeNumber(prime += 2));
            }
        }
        printf("prime = %ld, num = %ld\n", prime, num);
    }
    return 0;
}
