//
//  main.m
//  Problem020
//
//  Created by 张贵广 on 8/2/16.
//  Copyright © 2016 GG. All rights reserved.
//

/*
 阶乘数字和
 n! 的意思是 n × (n − 1) × … × 3 × 2 × 1
 例如，10! = 10 × 9 × … × 3 × 2 × 1 = 3628800，所以10!的各位数字和是 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27。
 求出100!的各位数字和。
 */

/*
 100! < 100^100 = 10^200
 这个乘积小于200位数，
 使用一个数组保存各个数位的值，计算完成后，遍历数组计算和即可
 
 */

#import <Foundation/Foundation.h>
#define NUM_DIGIT 200

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int product[NUM_DIGIT] = {1};
        
        for (int i=1; i<=100; i++) {
            for (int j=0; j<NUM_DIGIT; j++) {
                product[j] *= i;
            }
            for (int j=0; j<NUM_DIGIT; j++) {
                // 进位
                product[j+1] += product[j]/10;
                product[j] %= 10;
            }
        }
        
        int sum = 0;
        for (int i=NUM_DIGIT-1; i>=0; i--) {
            sum += product[i];
            printf("%d", product[i]);
        }
        printf("\n");
        NSLog(@"sum = %d", sum);
    }
    return 0;
}
