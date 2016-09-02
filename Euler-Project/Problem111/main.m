//
//  main.m
//  Problem111
//
//  Created by 张贵广 on 16/8/29.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 考虑一个有重复数字的4位素数，显然这4个数字不能全都一样：1111被11整除，2222被22整除，依此类推；但是，有9个4位素数包含有三个一：
 1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111
 我们记M(n, d)是n位素数中数字d重复出现的最多次数，N(n, d)是这类素数的个数，而S(n, d)是这类素数的和。
 因此M(4, 1) = 3是4位素数中数字1重复出现的最多次数，有N(4, 1) = 9个这类素数，而它们的和是S(4, 1) = 22275。还能得出，对于d = 0，在4位素数中最多重复出现M(4, 0) = 2次，但是有N(4, 0) = 13个这类素数。
 同样地，我们可以得到4位素数的如下结果。
 数字d	M(4, d)	N(4, d)	S(4, d)
 0	2	13	67061
 1	3	9	22275
 2	3	1	2221
 3	3	12	46214
 4	3	2	8888
 5	3	1	5557
 6	3	1	6661
 7	3	9	57863
 8	3	1	8887
 9	3	7	48073
 对于d = 0至9，所有S(4, d)的和为273700。
 
 求所有S(10, d)的和。
 */
/*
 遍历10位数字寻找素数是必不可少的，
 定义 数组M[10]记录M(10, d), S[10]记录S(10, d)
 每找到一个素数prime，求得prime中各种数字出现的次数，
 如果某个数字d的次数m == M(10, d), 那么对应d的 S[d] += prime
 如果d的次数m > M(10, d), 那么 M[d] = m, S[d] = prime
 
 5分钟计算了0.1%，猜测是判断质数花费了大量时间
 需要改进判断方法。
 判断的数中最大的是，100亿-1， 它的平方根 < 10万
 因此，先把小于10万的质数找出来，为一个集合，
 判断是否是质数，只需要判断一个数能否被集合里面的质数整除即可
 10分钟计算1%。。。还是超慢
 如果某个数字大于5个，那么其他数字一定不会很多，直接结束这个素数的数字统计，然而，这个想法是失败的。。
 每分解出一个数字就要判断一次，似乎反而拉慢了进度，而且这样只会得出所有的M(10, d) <= 5的错误结果
 
 根据素数定理， 10亿以内的素数大约有5000W个， 而100亿以内大约有45000W个，
 那么在我们需要计算的范围(10亿~100亿)内，素数大约有4亿个。。对这4亿个数统计也要花大量的时间啊！
 计算程序运行时间，得出结果，判断素数花费的时间，是分解素数几百上千倍，看来，找素数似乎还需要进一步优化
 
 */

#import <Foundation/Foundation.h>
#define NUM_START 1000000001
#define NUM_END   10000000000
#define SIZE      100000
#define LENGTH    10

int primeList[10000] = {0};
int primeLength = 0;

BOOL isPrimeNumber(int num) {
    if (num<=1) {
        return NO;
    }
    int end = sqrt(num);
    for (int i=2; i<=end; i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    return YES;
}

BOOL largeNumberIsPrime(long num) {
    long end = sqrt(num);
    for (int i=0; i<primeLength || primeList[i]>end; i++) {
        if (num%primeList[i] == 0) {
            return NO;
        }
    }
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"start");
        int  M[LENGTH] = {0};
        long S[LENGTH] = {0};
        
        int cM[LENGTH] = {0};
        long prime = 0;
        
        // 先找出100000以内的素数
        for (int i=3; i<SIZE; i+=2) {
            if (isPrimeNumber(i)) {
                primeList[primeLength++] = i;
            }
        }
        NSLog(@"%ld", sizeof(int));
        
        time_t jTime = 0;
        time_t cTime = 0;
        time_t start = 0;
        time_t end   = 0;
        BOOL f = 0;
        for (long i=NUM_START; i<NUM_END; i+=2) {
            start = clock();
            f = largeNumberIsPrime(i);
            end = clock();
            jTime += end - start;
            
            if (f) {
                start = clock();
                memset(cM, 0, sizeof(int) * LENGTH);
                prime = i;
                while (prime > 0) {
                    cM[prime%10]++;
                    prime /= 10;
                }
                
                for (int d=0; d<LENGTH; d++) {
                    if (M[d] == cM[d]) {
                        S[d] += i;
                    }
                    else if (M[d] < cM[d]) {
                        M[d] = cM[d];
                        S[d] = i;
                    }
                }
                end = clock();
                cTime += end-start;
            }
        }
        
        long sum = 0;
        for (int d=0; d<LENGTH; d++) {
            NSLog(@"S(10, %d) = %ld", d, S[d]);
            sum += S[d];
        }
        NSLog(@"∑S(10, d) = %ld", sum);
    }
    return 0;
}
