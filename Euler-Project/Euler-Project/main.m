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

// 回文数
BOOL isPalindrome(int num) {
    static int powOf10[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
    int length = 1;
    while (num/powOf10[length++] > 0);
    length--;
    
    for (int i=0; i<length/2; i++) {
        int high = num / powOf10[length-1-i*2];
        num %= powOf10[length-1-i*2];
        int low = num % 10;
        num /= 10;
        if (high != low) {
            printf("not palindrome\n");
            return NO;
        }
    }
    printf("is palindrome\n");
    return YES;
}
// 回文数， base 表示进制
BOOL isPalindromeWithBase(const int num, int base) {
    int temp = num;
    int num2 = 0;
    while (temp > 0) {
        num2 = num2 * base + temp % base;
        temp /= base;
    }
    printf("%d is Palindrome?? %d", num, num==num2);
    return num==num2;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 这里存一些经常会用的方法
        
        // 计算一个数字的位数
        int powOf10[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
        int num = 444;
        int length = 1;
        while (num/powOf10[length++] > 0);
        length--;
        
    }
    return 0;
}
