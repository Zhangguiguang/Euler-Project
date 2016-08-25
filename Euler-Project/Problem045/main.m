//
//  main.m
//  Problem045
//
//  Created by 张贵广 on 16/8/25.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 三角形数、五边形数和六角形数
 
 三角形数、五边形数和六角形数分别由以下公式给出：
 三角形数	Tn=n(n+1)/2     1, 3, 6, 10, 15, …
 五边形数	Pn=n(3n−1)/2	1, 5, 12, 22, 35, …
 六边形数	Hn=n(2n−1)      1, 6, 15, 28, 45, …
 
 可以验证，T285 = P165 = H143 = 40755。
 找出下一个同时是三角形数、五边形数和六角形数的数。
 */

/*
 下一个数应当从T286开始计算
 每计算一个三角形数，根据五边形数和六边形数的公式，分别解出他们的n5, n6的值，
 必须满足n5, n6 都是正整数，这时才满足情况
 
 根据公式推导
 n5 = sqrt(2/3*num + 1/36) + 1/6;
 n6 = sqrt(num/2 + 1/16) + 1/4;
 
 T55385 = P31977 = H27693 = 1533776805
 */

#import <Foundation/Foundation.h>

double nF(long num) {
    return sqrt(2.0/3*num + 1.0/36) + 1.0/6;
}
double nS(long num) {
    return sqrt(num/2.0 + 1.0/16) + 1.0/4;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long n3 = 286;
        double n5, n6;
        
        long T = 0;
        while (1) {
            T = n3*(n3+1)/2;
            n5 = nF(T);
            if (n5 == ((long)n5)) {
                n6 = nS(T);
                if (n6 == (long)n6) {
                    break;
                }
            }
            n3++;
        }
        
        NSLog(@"T%ld = P%ld = H%ld = %ld", n3, (long)n5, (long)n6, T);
    }
    return 0;
}
