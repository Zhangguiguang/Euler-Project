//
//  main.m
//  Problem036
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 双进制回文数
 十进制数585 = 1001001001(2)（二进制表示），因此它在这两种进制下都是回文数。
 找出所有小于一百万，且在十进制和二进制下均回文的数，并求它们的和。
 （请注意，无论在哪种进制下，回文数均不考虑前导零。）
 */

/*
 遍历1-100W, 先判断它是不是回文数，
 如果是再转化为二进制字符串，再判断是不是回文数 （这种想法太low了）
 
 偶数的二进制一定是这样的 101...0, 那么偶数的二进制一定不是回文数
 
 回文数的判断，本来打算 取一个高位，一个低位，做比较。虽然方法我写出来了。
 但我突然想到了一个直观更好实现的方法。。。
 123 % 10 = 3           num = 3
 (12 % 10 = 2) + 3*10   num = 32
 (1 % 10 = 1) + 32*10   num = 321
 最后比较 (123==321)??
 而且，把10换成2，就成为判断二进制回文数的方法了,
 
 1 + 3 + 5 + 7 + 9 + 33 + 99 + 313 + 585 + 717 + 7447 + 9009 + 15351 + 32223 + 39993 + 53235 + 53835 + 73737 + 585585
 sum = 872187
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 1000000

BOOL isPalindromeWithBase(const int num, int base) {
    int temp = num;
    int num2 = 0;
    while (temp > 0) {
        num2 = num2 * base + temp % base;
        temp /= base;
    }
//    printf("%d is Palindrome?? %d\n", num, num==num2);
    return num==num2;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        isPalindromeWithBase(312, 10);
//        isPalindromeWithBase(43234, 10);

        // 既然偶数在二进制下一定不是回文数， i+=2
        long sum = 0;
        for (int i=1; i<MAX_LENGTH; i+=2) {
            if (isPalindromeWithBase(i, 10) && isPalindromeWithBase(i, 2)) {
                printf("%d + ", i);
                sum += i;
            }
        }
        printf("\n");
        printf("sum = %ld\n", sum);
    }
    return 0;
}
