//
//  main.m
//  Problem048
//
//  Created by 张贵广 on 16/8/25.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 自幂
 十项的自幂级数求和为 1^1 + 2^2 + 3^3 + … + 10^10 = 10405071317。
 求如下一千项的自幂级数求和的最后10位数字：1^1 + 2^2 + 3^3 + … + 1000^1000。
 */

/*
 很简单
 */

#import <Foundation/Foundation.h>
#define MAX_DIGITAL 1000
#define TEN_ZERO 10000000000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long result = 0;
        long product = 0;
        
        for (int i=1; i<=MAX_DIGITAL; i++) {
            product = 1;
            for (int j=1; j<=i; j++) {
                product *= i;
                product %= TEN_ZERO;
            }
            result += product;
            result %= TEN_ZERO;
        }
        
        NSLog(@"result = %ld", result);
    }
    return 0;
}
