//
//  main.m
//  Problem013
//
//  Created by 幸福羽衣甘蓝 on 15/8/13.
//  Copyright (c) 2015年 幸福羽衣甘蓝. All rights reserved.
//
//
//  以前在实习用别人的电脑写的
//  现在只是拿来打开，修改下输出
//  答案 result 5537376230390876637302048746832985971773659831892672

#import <Foundation/Foundation.h>
#include <stdio.h>

void printArr(int *arr, int length) {
    for (int i=0; i<length; i++) {
        printf("%d", arr[i]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int add[50];
        FILE *fp;
        fp = fopen("/Users/zhangguiguang/Documents/Euler-Project/Euler-Project/Problem013/input.txt", "rt");
        
        // 初始化
        //        printArr(add, 50);
        for (int i=0; i<50; i++) {
            add[i] = 0;
        }
        //        printf("=============================\n");
        //        printArr(add, 50);
        
        for (int i=0; i<100; i++) {
            for (int j=0; j<50; j++) {
                add[j] += (fgetc(fp)-48);
            }
            // 读取\n
            fgetc(fp);
        }
        fclose(fp);
        
        printf("\n");
        printArr(add, 50);
        
        for (int i=0; i<49; i++) {
            add[48-i] += add[49-i]/10;
            add[49-i] = add[49-i]%10;
        }
        
        printf("\n");
        
        NSLog(@"result");
        printArr(add, 50);
        printf("\n");
        
        
        
        
    }
    return 0;
}
