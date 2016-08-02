//
//  main.m
//  Problem052
//
//  Created by 张贵广 on 16/8/2.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 重排的倍数
 可以看出，125874和它的两倍251748拥有同样的数字，只是排列顺序不同。
 有些正整数x满足2x、3x、4x、5x和6x都拥有相同的数字，求其中最小的正整数。
 */

/*
 准备两个数组，长度都为10，一个记录原数中各种数字的个数
 另一个记录x2中各种数字的个数，再对比两个数组是否一一对应，
 满足继续判断x3...x6，不满足跳过
 既然是找到满足情况的最小整数，那么找到的第一个数即满足情况。
 
 result = 142857
 */

#import <Foundation/Foundation.h>

#define printArr(arr, length) for (int i=0; i<length; i++) printf("%d, ", arr[i]); printf("\n");
#define LENGTH 10
#define MAX_MULTIPLE 6

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sourceNum[LENGTH] = {0};
        int multipleNum[LENGTH] = {0};
        
//        for (int i=1; i<=MAX_MULTIPLE; i++) {
//            NSLog(@"%d * %d = %d", 142857, i, 142857 * i);
//        }
        
        for (int i=10; ; i++) {
            int num = i;
            memset(sourceNum, 0, LENGTH*sizeof(int));
            while (num > 0) {
                sourceNum[num%10]++;
                num /= 10;
            }
            
            for (int j=2; j<=MAX_MULTIPLE; j++) {
                num = i*j;
                memset(multipleNum, 0, LENGTH*sizeof(int));
                while (num > 0) {
                    int index = num % 10;
                    multipleNum[index]++;
                    if (multipleNum[index] > sourceNum[index]) {
                        goto notAccord;
                    }
                    num /= 10;
                }
                // 对比两个数组是否相等
                for (int k=0; k<LENGTH; k++) {
                    if (sourceNum[k] != multipleNum[k]) {
                        goto notAccord;
                    }
                }
            }
            NSLog(@"result = %d", i);
            return 0; // 如果不return 0; 还能找到更多满足条件的数，只是不满足最小而已。
            notAccord: ;
        }
    }
    return 0;
}
