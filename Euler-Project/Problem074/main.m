//
//  main.m
//  Problem074
//
//  Created by 张贵广 on 8/3/16.
//  Copyright © 2016 GG. All rights reserved.
//

/*
 数字阶乘链
 
 145之所以广为人知，是因为它的各位数字的阶乘之和恰好等于本身：
 1! + 4! + 5! = 1 + 24 + 120 = 145
 而169则可能不太为人所知，尽管从169开始不断地取各位数字的阶乘之和构成了最长的循环回到169；事实上，只存在三个这样的循环：
 169 → 363601 → 1454 → 169
 871 → 45361 → 871
 872 → 45362 → 872
 
 不难证明，从任意数字出发最终都会陷入循环。例如，
 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
 78 → 45360 → 871 → 45361 (→ 871)
 540 → 145 (→ 145)
 
 从69开始可以得到一个拥有五个不重复项的链，但是从一个小于一百万的数出发能够得到的最长的无重复项链包含有60项。
 从小于一百万的数出发，有多少条链恰好包含有60个不重复项？
 */

/*
 从题目的意思可以看出，不管任何数，不断得到取各位数字的阶乘之和， 最后一定会得到 145,169,871或872, 实际上还应该有 1→1, 2→2
 因此 还是用 1000000个元素的数组，把所有数字的阶乘之和都放入其中
 再逐个遍历寻找数字不重复的链
 
 123456, 123465, 123654...654321, 其实都可以看做同一个数，这个问题大约可以看做9种数字的6位任意组合(0!=1!=1，0和1可以看做一样的数)
 AAAAAA
 
 AB AAAA
 AB AAAB
 AB AABB
 AB ABBB
 AB BBBB
 
 ABC AAA
 ABC BBB
 ABC CCC
 ABC AAB
 ABC AAC
 ABC ABB
 ABC ACC
 ABC BBC
 ABC BCC
 
 ABCD AA
 ABCD BB
 ABCD CC
 ABCD AB
 ABCD AC
 ABCD BC
 
 ABCDE A
 ABCDE B
 ABCDE C
 ABCDE D
 ABCDE E
 
 ABCDEF
 
 组合的数量 =  9 * 1
            + 9 * 8 * 6
            + 9 * 8 * 7 * 9
            + 9 * 8 * 7 * 6 * 6
            + 9 * 8 * 7 * 6 * 5 * 1
          = 38241
 组合的数量不到40000，而实际得到的阶乘和种类只有4013种， 因为很多数字的阶乘和都相等
 既然只有4000种，每种最多计算60次阶乘和，24W的计算量不算大，直接暴力计算了。
 
 count = 402
 
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 1000000
#define SUMCONNTPAIR 4100
#define CIRCLE_LENGTH 60

typedef struct SumCount {
    int sum;
    int count;
}SumCount;

int factorial[10] = {1};

int getSumOfFactorial(int x) {
    int sum = 0;
    while (x > 0) {
        sum += factorial[x%10];
        x /= 10;
    }
    return sum;
}

int circleWayLengthIsMatch(int num) {
    int sumWay[CIRCLE_LENGTH+1] = {num};
    int sum = num;
    int length = 2;
    while (1) {
        sum = getSumOfFactorial(sum);
        
        // 判断sum在sumWay中是否存在，存在时，判断当前length是否等于60，不存在加进去
        for (int i=0; i<CIRCLE_LENGTH; i++) {
            if (sumWay[i] == sum) {
                return (length == CIRCLE_LENGTH);
            }
            else if (sumWay[i] == 0) {
                if (length >= CIRCLE_LENGTH) {
                    return 0;
                }
                sumWay[i] = sum;
                length++;
                break;
            }
        }
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SumCount pair[SUMCONNTPAIR] = {0};
        
        for (int i=1; i<10; i++) { // 先计算出1-9的阶乘
            factorial[i] = factorial[i-1] * i;
        }
        
        // 下一个不同的阶乘和要放在point指向的结构体数组
        int sum = 0;
        for (int i=1; i<MAX_LENGTH; i++) {
            sum = getSumOfFactorial(i);
            
            // 判断数组有没有相同的阶乘和
            for (int j=0; j<MAX_LENGTH; j++) {
                if (pair[j].sum == 0) {
                    // 遇到了等于0的项，则还没有出现这个数
                    pair[j].sum = sum;
                    pair[j].count = 1;
                    break;
                }
                else if (pair[j].sum == sum) {
                    // 遇到了阶乘和相同的数
                    pair[j].count++;
                    break;
                }
            }
        }
        
        int count = 0;
        for (int i=0; ; i++) {
            if (pair[i].sum == 0) {
                // 计算结束
                break;
            }
            
            if (circleWayLengthIsMatch(pair[i].sum)) {
                count += pair[i].count;
            }
        }
        
        NSLog(@"count = %d", count);
        
        
    }
    return 0;
}
