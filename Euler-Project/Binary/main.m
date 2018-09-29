//
//  main.m
//  Binary
//
//  Created by 张贵广 on 2018/09/29.
//  Copyright © 2018 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 输出的二进制，为反序的格式
 例
 2 = 01
 12 = 0011
 */
void printBinary(int x) {
    printf("%d = ", x);
    unsigned int y = x; // 需要无符号位移
    while (y != 0) {
        printf("%d", (int)y&1);
        y >>= 1;
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printBinary(13);
        printBinary(-13);
        
        printBinary(10);
        printBinary(-10);
    }
    return 0;
}
