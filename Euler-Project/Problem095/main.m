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
 计算i的真因数之和 = x, 若x>1000000, flag[i]=LargeNumber,
                     若x == i, flag[i]=PerfectNumber,
                     若x == 1, flag[i]=PrimeNumber
                     否则 flag[i] = x
 
 遍历flag，先找长度为2的链，再遍历找长度为3的链。。。找到这样的链，把这些数字都标记为CircleNumber
 
 length = 2 : 220, 1184, 2620, 5020, 6232, 10744, 12285, 17296, 63020, 66928, 67095, 69615, 79750, 100485, 122265, 122368, 141664, 142310, 171856, 176272, 185368, 196724, 280540, 308620, 319550, 356408, 437456, 469028, 503056, 522405, 600392, 609928, 624184, 635624, 643336, 667964, 726104, 802725, 879712, 898216,
 ....
 length = 5 : 12496,
 ......
 length = 28 : 14316,
 
 实际上，能构成链的只有这么3种长度
 
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 1000000

typedef enum NumType {
    PerfectNumber = -1, // 完全数
    PrimeNumber = -2,   // 素数
    LargeNumber = -3,   // 超过 MAX_LENGTH 的数
    CircleNumber = -4
}NumType;

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

int finish(int* flag, int length) {
    for (int i=0; i<length; i++) {
        if (flag[i] > 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int flag[MAX_LENGTH+1] = {LargeNumber, LargeNumber};
        
        for (int i=2; i<=MAX_LENGTH; i++) {
            if (flag[i] == 0) {
                int sum = sumOfProperDivisors(i);
                if (sum == 1) {
                    flag[i] = PrimeNumber;
                }
                else if (sum == i) {
                    flag[i] = PerfectNumber;
                }
                else if (sum > MAX_LENGTH) {
                    flag[i] = LargeNumber;
                }
                else {
                    flag[i] = sum;
                }
            }
        }
        
//        int num = 14316;
//        for (int i=0; i<29; i++) {
//            printf("%d → ", num=flag[num]);
//        }
        
        int length = 2;
        while (!finish(flag, MAX_LENGTH+1)) {
            printf("length = %d : ", length);
            for (int i=2; i<=MAX_LENGTH; i++) {
                if (flag[i] < 0) {
                    continue;
                }
                int x = i;
                for (int j=0; j<length; j++) {
                    x = flag[x];
                    if (x < 0) {
                        flag[i] = x;
                        break;
                    }
                }
                // 满足长度为length的链
                if (x == i) {
                    printf("%d, ", i);
                    for (int j=0; j<length; j++) {
                        int y = flag[x];
                        flag[x] = CircleNumber;
                        x = y;
                    }
                }
            }
            printf("\n");
            length ++;
        }
        
    }
    return 0;
}
