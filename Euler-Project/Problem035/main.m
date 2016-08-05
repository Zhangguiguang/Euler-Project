//
//  main.m
//  Problem035
//
//  Created by 张贵广 on 16/8/5.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 圆周素数
 197被称为圆周素数，因为将它逐位旋转所得到的数：197/971和719都是素数。
 小于100的圆周素数有十三个：2、3、5、7、11、13、17、31、37、71、73、79和97。
 小于一百万的圆周素数有多少个？
 */

/*
 遍历1-100W, 找到一个素数，把它逐位旋转，判断。
 
 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97, 113, 131, 197, 199, 311, 337, 373, 719, 733, 919, 971, 991, 1193, 1931, 3119, 3779, 7793, 7937, 9311, 9377, 11939, 19391, 19937, 37199, 39119, 71993, 91193, 93719, 93911, 99371, 193939, 199933, 319993, 331999, 391939, 393919, 919393, 933199, 939193, 939391, 993319, 999331,
 count = 55
 */

#import <Foundation/Foundation.h>
#define MAX_LENGTH 1000000

BOOL isPrimeNumber(long num) {
    long end = sqrt(num);
    for (long i=2; i<=end; i++) {
        if (num%i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int powOf10[] = {1, 10, 100, 1000, 10000, 100000, 1000000};
        
        int count = 1; // 先把2排除掉，i才能+=2
        printf("2, ");
        for (int i=3; i<MAX_LENGTH; i+=2) {
            if (isPrimeNumber(i)) {
                int length = 1;
                while (i/powOf10[length++] > 0);
                length--;
                
                if (length == 1) {
                    count ++;
                    printf("%d, ", i);
                    continue;
                }
                int num = i;
                while (1) {
                    num = num/10 + num%10*powOf10[length-1];
                    if (num == i) {
                        count++;
                        printf("%d, ", i);
                        break;
                    }
                    if (!isPrimeNumber(num)) {
                        break;
                    }
                }
            }
        }
        printf("\n");
        printf("count = %d\n", count);
    }
    return 0;
}
