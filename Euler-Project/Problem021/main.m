//
//  main.m
//  Problem021
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 亲和数
 记d(n)为n的所有真因数（小于n且整除n的正整数）之和。
 如果d(a) = b且d(b) = a，且a ≠ b，那么a和b构成一个亲和数对，a和b被称为亲和数。
 例如，220的真因数包括1、2、4、5、10、11、20、22、44、55和100，因此d(220) = 284；而284的真因数包括1、2、4、71和142，因此d(284) = 220。
 求所有小于10000的亲和数的和。
 */

/*
 直接参照Problem95做了。
 
 */

#import <Foundation/Foundation.h>
#define MAX_NUMBER 10000

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
    return sum;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int allSum = 0;
        for (int i=2; i<=MAX_NUMBER; i++) {
            int sum = sumOfProperDivisors(i);
            if (sum > MAX_NUMBER || sum == i) {
                continue;
            }
            if (sumOfProperDivisors(sum) == i) {
                // sum 和 i是亲和数
                printf("%d + ", i);
                allSum += i;
            }
        }
        printf("\n");
        printf("sum = %d\n", allSum);
        
    }
    return 0;
}
