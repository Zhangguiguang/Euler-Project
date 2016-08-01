//
//  main.m
//  Project009
//
//  Created by 张贵广 on 15/9/18.
//  Copyright (c) 2015年 HZNU. All rights reserved.
//
/*
 
 特殊毕达哥拉斯三元组
 
 毕达哥拉斯三元组是三个自然数a < b < c组成的集合，并满足
 
 a^2 + b^2 = c^2
 例如，3^2 + 4^2 = 9 + 16 = 25 = 5^2。
 
 有且只有一个毕达哥拉斯三元组满足 a + b + c = 1000。求这个三元组的乘积abc。
 
 // 由于 a+b+c = 1000，且 a<b<c， 那么a<333
 // 而同理，b+c<1000，且b<c，所以b<500
 // 满足条件的有且只有一组，找到答案时便可结束了
 
 // 答案 a = 200, b = 375, c = 425
 a * b * c = 31875000
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a, b, c;
        
        for (a = 1; a < 333; a++) {
            for (b = a+1; b < 500; b++) {
                c = 1000 - a - b;
                if (a*a + b*b == c*c) {
                    NSLog(@"a = %i, b = %i, c = %i", a, b, c);
                    NSLog(@"a * b * c = %i", a*b*c);
                    return 0;
                }
            }
        }
        
    }
    return 0;
}
