//
//  main.m
//  Problem112
//
//  Created by 张贵广 on 16/9/2.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 弹跳数
 从左往右，如果每一位数字都大于等于其左边的数字，这样的数被称为上升数，比如134468。
 同样地，如果每一位数字都大于等于其右边的数字，这样的数被称为下降数，比如66420。
 如果一个正整数既不是上升数也不是下降数，我们就称之为“弹跳”数，比如155349。
 
 显然不存在小于一百的弹跳数，而在小于一千的数中有略超过一半（525）的弹跳数。事实上，使得弹跳数的比例恰好达到50%的最小数是538。
 令人惊奇的是，弹跳数将变得越来越普遍，到21780时，弹跳数的比例恰好等于90%。
 找出使得弹跳数的比例恰好为99%的最小数。
 */

/*
 显然，统计非弹跳数比较高效
 而且，既然题目已经给出了 当n=21780时，已经有了90%的弹跳数，那么计算起点为21780
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int n = 21780;
    int count = n * 10 / 100;
    
    int temp = 0;
    int low = 0;
    int order = 0;
    int flag = 0;
    int remainder = 0;
    while (n++ != count * 100) {
        low = n % 10;
        temp = n / 10;
        order = -1;
        flag = 1;
        while (temp > 0) {
            remainder = temp % 10;
            if (order == -1) {
                if (low > remainder) {
                    order = 1;
                }
                else if (low < remainder) {
                    order = 0;
                }
            }
            else if (order && low < remainder) {
                flag = 0;
                break;
            }
            else if (!order && low > remainder) {
                flag = 0;
                break;
            }
            low = remainder;
            temp /= 10;
        }
        count += flag;
    }
    n--;
    printf("%d\n", n);
    
    return 0;
}
