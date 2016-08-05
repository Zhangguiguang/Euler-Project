//
//  main.m
//  Problem025
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 一千位斐波那契数
 斐波那契数列是按如下递归关系定义的数列：
 F1 = 1 F2 = 1
 Fn = Fn−1 + Fn−2
 因此斐波那契数列的前12项分别是：
 F1 = 1
 F2 = 1
 F3 = 2
 F4 = 3
 ......
 F10 = 55
 F11 = 89
 F12 = 144
 第一个有三位数字的项是第12项F12。
 
 在斐波那契数列中，第一个有1000位数字的是第几项？
 */

/*
 这个问题最大的难点是超大数的表示以及相加
 估计大概第4000左右的项有1000个数字，计算量并不算大，并没有什么技巧可言
 
 index = 4782
 */

#import <Foundation/Foundation.h>
#define MAX_BIT 1000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int num[2][MAX_BIT] = {{1},{1}};
        int index = 2; // 已经有两项了
        
        int i=1;
        while (i++) {
            int target = i % 2;
            for (int j=0; j<MAX_BIT; j++) {
                // 两数相加
                num[target][j] = num[0][j] + num[1][j];
            }

            for (int j=0; j<MAX_BIT; j++) {
                // 进位
                if (num[target][j] >= 10) { // 粗心啊！不写等号，233 + 377 = 5 10 10，就不能正确转化，结果错误
                    num[target][j+1] += (num[target][j] / 10);
                    num[target][j] %= 10;
                }
            }
            index ++;
            if (num[0][MAX_BIT-1] || num[1][MAX_BIT-1]) {
                printf("index = %d\n", index);
                // 1000位的数字已经找到了
                break;
            }
        }
    }
    return 0;
}
