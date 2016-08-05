//
//  main.m
//  Problem040
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 钱珀瑙恩常数
 
 将所有正整数连接起来构造的一个十进制无理数如下所示：
 0.123456789101112131415161718192021…
 可以看出小数点后第12位数字是1。
 
 如果dn表示上述无理数小数点后的第n位数字，求下式的值：
 d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
 */

/*
 so easy.
 
 1 x 1 x 5 x 3 x 7 x 2 x 1 
 product = 210
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        const int count = 7;
        int decimalPlaces[count] = {1, 10, 100, 1000, 10000, 100000, 1000000};
        int powOf10[count] = {1, 10, 100, 1000, 10000, 100000, 1000000};
        int index = 0; // 找到一个小数就加1，so，当index==count，所有的小数都找到了
        
        int currentPlace = 0;
        int product = 1;
        for (int i=1; index<count; i++) {
            // 就是个数数字的问题
            int length = 1;
            int divisor = 10;
            while (i/divisor > 0) {
                length++;
                divisor *= 10;
            }
            
            currentPlace += length;
            if (currentPlace >= decimalPlaces[index]) {
                int tail = currentPlace - decimalPlaces[index];
                int targetNumber = i / powOf10[tail] % 10;
                printf("%d x ", targetNumber);
                product *= targetNumber;
                index ++;
            }
        }
        printf("\n");
        printf("product = %d\n", product);
    }
    return 0;
}
