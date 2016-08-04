//
//  main.m
//  Problem050
//
//  Created by 张贵广 on 8/4/16.
//  Copyright © 2016 GG. All rights reserved.
//

/*
 连续素数的和
 
 素数41可以写成六个连续素数的和：
 41 = 2 + 3 + 5 + 7 + 11 + 13
 在小于一百的素数中，41能够被写成最多的连续素数的和。
 在小于一千的素数中，953能够被写成最多的连续素数的和，共包含连续21个素数。
 在小于一百万的素数中，哪个素数能够被写成最多的连续素数的和？
 */

/*
 小于100W的素数我不知道有多少，不知道用多大的数组来存储这些，
 先大概估计下，能被2，3整除的数有50W, 33W,但一定不是用减的。
 大约估计有 100W/2/3 = 16.6W, 先设置小一点的数组，测试出100W内的素数有78498个
 
 如果使用穷举法，则计算次数为 8W*(8W+1)/2 ≈ 32亿次
 但是很显然，当连续加素数大于最大的素数后，即可马上终止这次的循环

 既然小于1000的素数中，最多有21个连续素数和是素数，则小于100W一定有大于或等于这个长度的，
 32亿次，大概可以减少到32/21 = 1.5亿次，那么穷举法也可行了。
 
 result : 运行时间并不长，1s不到就结束了。
 
 from 2 start, number of 2 primes's sum = 5, is prime
 from 2 start, number of 4 primes's sum = 17, is prime
 from 2 start, number of 6 primes's sum = 41, is prime
 ......
 from 2 start, number of 536 primes's sum = 958577, is prime
 from 5 start, number of 537 primes's sum = 970219, is prime
 from 5 start, number of 539 primes's sum = 978037, is prime
 from 7 start, number of 543 primes's sum = 997651, is prime
 
 */



#import <Foundation/Foundation.h>

#define MAX_RANGE 1000000
#define PRIME_LENGTH 78497

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
        int primes[PRIME_LENGTH] = {2};
        int index = 1; // 下一个素数要放置的位置
        
        for (int i = 3; i<MAX_RANGE; i+=2) {
            if (isPrimeNumber(i)) {
                primes[index++] = i;
            }
        }
        
        int maxCount = 0;
        for (int i=0; i<PRIME_LENGTH-1; i++) {
            int sum = primes[i];
            int count = 1;
            for (int j=i+1; sum<primes[PRIME_LENGTH-1]; j++) {
                sum += primes[j];
                count ++;
                if (isPrimeNumber(sum)) {
                    if (count > maxCount) {
                        maxCount = count;
                        NSLog(@"from %d start, number of %d primes's sum = %d, is prime", primes[i], count, sum);
                    }
                }
            }
        }
    }
    return 0;
}
