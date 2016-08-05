//
//  main.m
//  Problem030
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 各位数字的五次幂
 
 令人惊讶的是，只有三个数可以写成它们各位数字的四次幂之和：
 1634 = 1^4 + 6^4 + 3^4 + 4^4
 8208 = 8^4 + 2^4 + 0^4 + 8^4
 9474 = 9^4 + 4^4 + 7^4 + 4^4
 由于1 = 1^4不是一个和，所以这里并没有把它包括进去。
 这些数的和是1634 + 8208 + 9474 = 19316。
 
 找出所有可以写成它们各位数字的五次幂之和的数，并求这些数的和。
 */

/*
 令人惊讶的是，只有三个数......
 然而，我并不惊讶，这样的数字有限是必然的
 9^4 = 6561，当数字过大，原有添加一个数字时，必然会大于9^4
 9^4*4 = 26244 > 9999
 9^4*5 = 32805 < 99999, 满足条件的数字范围为 10-32805之间，当然是有限的
 
 同理
 9^5 = 59049
 9^5*5 = 295245 > 99999
 9^5*6 = 354294 < 999999 , 满足五次幂之和等于原数的数字，范围为 10-354294
 
 接下来就easy了
 
 4150 + 4151 + 54748 + 92727 + 93084 + 194979
 sum = 443839
 */

#import <Foundation/Foundation.h>
#define MAX_NUMER 354294

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int fifthPowers[10] = {0}; // 事先存储0-9的五次幂
        for (int i=0; i<10; i++) {
            fifthPowers[i] = pow(i, 5);
        }
        
        long allSum = 0;
        for (int i=10; i<MAX_NUMER; i++) {
            int sum = 0;
            int num = i;
            while (num > 0) {
                sum += fifthPowers[num%10];
                num /= 10;
            }
            if (sum == i) {
                printf("%d + ", i);
                allSum += i;
            }
        }
        
        printf("\n");
        printf("sum = %ld\n", allSum);
    }
    return 0;
}
