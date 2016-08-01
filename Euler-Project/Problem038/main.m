//
//  main.m
//  Euler Problem38
//
//  Created by 张贵广 on 16/8/1.
//  Copyright © 2016年 BKY. All rights reserved.
//
/*
 全数字的倍数
 
 将192分别与1、2、3相乘：
 
 192 × 1 = 192
 192 × 2 = 384
 192 × 3 = 576
 
 连接这些乘积，我们得到一个1至9全数字的数192384576。我们称192384576为192和(1,2,3)的连接乘积。
 
 同样地，将9分别与1、2、3、4、5相乘，得到1至9全数字的数918273645，即是9和(1,2,3,4,5)的连接乘积。
 
 对于n > 1，所有某个整数和(1,2, … ,n)的连接乘积所构成的数中，最大的1至9全数字的数是多少？
 */

/*
 显然，由于n>1, 则满足情况至少是 x*(1, 2)， 那么x为4位数，乘2后为5位数， 即x <= 9999
 所以只需遍历 1-9999 的数字即可
 最大全数字 = 932718654 = 9327*(1,2)
 */
#import <Foundation/Foundation.h>

// 输入一个数字，判断它是否能形成全数字，能则返回这个数字串，不能返回nil
NSString * isMatch(int x) {
    int flag[10] = {0};
    NSMutableString *result = [NSMutableString new];
    
    for (int i=1; i<=9; i++) {
        int product = x*i;
        while (product > 0) {
            int digit = product % 10;
            if (flag[digit]) {
                return nil; // 这个数字已经出现过一次，再出现就不满足要求了
            }
            flag[digit] = 1;
            product /= 10;
        }
        [result appendFormat:@"%d", x*i];
        
        // 判断flag里面 1-9元素是否都为1
        int f = 1;
        for (int j=1; j<=9; j++) {
            if (flag[j] == 0) {
                f = 0;
                break;
            }
        }
        if (f) {
            return result;
        }
    }
    
    return nil;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        for (int i=1; i<9999; i++) {
            NSString *result = isMatch(i);
            if (result) {
                NSLog(@"%@, %d", result, i);
            }
        }
    }
    return 0;
}
