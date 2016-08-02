//
//  main.m
//  Problem095
//
//  Created by 张贵广 on 16/8/2.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 亲和数链
 一个数除了本身之外的因数称为真因数。例如，28的真因数是1、2、4、7和14。这些真因数的和恰好为28，因此我们称28是完全数。
 有趣的是，220的真因数之和是284，同时284的真因数之和是220，构成了一个长度为2的链，我们也称之为亲和数对。
 有一些更长的序列并不太为人所知。例如，从12496出发，可以构成一个长度为5的链：
 12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → …)
 由于这条链最后又回到了起点，我们称之为亲和数链。
 
 找出所有元素都不超过一百万的亲和数链中最长的那条，并给出其中最小的那个数。
 */

/*
 创建一个数组 flag[1000000] = {0};
 循环i 从 2 -> 1000000
 if flag[i] != 0, 跳过i
 else flag[i] == 0 
    计算i的真因数之和 = x, 若x>1000000, flag[i]=-1, 结束数字i的计算
                        若x == i, 结束数字i的计算
                        若x == 1, 这是个素数, flag[x] = -1, 结束计算
                        若x<=1000000, flag[i]++; flag[x]=-1; 继续计算x的真因数之和y,继续以上的操作
 计算结束，遍历数组，找到最大值，并输出这个元素的下标
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 1000000

enum NumType {
    PerfectNumber = MAX_LENGTH+1,
    
} int;

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
    NSLog(@"sumOfProperDivisors(%d) = %d", num, sum);
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int flag[MAX_LENGTH+1] = {0};
        
        for (int i=2; i<=MAX_LENGTH; i++) {
            if (flag[i] == 0) {
                int sum = sumOfProperDivisors(i);
                while (sum != i) {
                    if (sum > MAX_LENGTH || sum == 1) {
                        flag[i] = -1;
                        break;
                    }
                    flag[i]++;
                    flag[sum] = -1;
                    sum = sumOfProperDivisors(sum);
                }
            }
        }
        int max = 0;
        for (int i=2; i<=MAX_LENGTH; i++) {
            if (max < flag[i]) {
                max = flag[i];
                printf("max = %d, num = %d", max, i);
            }
        }
    }
    return 0;
}
