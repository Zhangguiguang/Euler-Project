//
//  main.m
//  Problem055
//
//  Created by 张贵广 on 16/8/25.
//  Copyright © 2016年 GG. All rights reserved.
//

/*
 利克瑞尔数
 将47倒序并相加得到47 + 74 = 121，是一个回文数。
 
 不是所有的数都能像这样迅速地变成回文数。例如，
 349 + 943 = 1292
 1292 + 2921 = 4213
 4213 + 3124 = 7337
 也就是说，349需要迭代三次才能变成回文数。
 尽管尚未被证实，但有些数，例如196，被认为永远不可能变成回文数。如果一个数永远不可能通过倒序并相加变成回文数，就被称为利克瑞尔数。出于理论的限制和问题的要求，在未被证否之前，我们姑且就认为这些数确实是利克瑞尔数。除此之外，已知对于任意一个小于一万的数，它要么在迭代50次以内变成回文数，要么就是没有人能够利用现今所有的计算能力将其迭代变成回文数。事实上，10677是第一个需要超过50次迭代变成回文数的数，这个回文数是
 4668731596684224866951378664（53次迭代，28位数）。
 令人惊讶的是，有些回文数本身也是利克瑞尔数数；第一个例子是4994。
 小于一万的数中有多少利克瑞尔数？
 注意：2007年4月24日，题目略作修改，以强调目前利克瑞尔数理论的限制。
 */

/*
 这个问题的关键不是计算量，而是防止溢出，
 1xxx9 + 9xxx1 = 1xxxx0, 这个数字会扩大10倍，虽然并不是每次迭代都扩大10倍，但经过50次迭代，一个long肯定装不下。
 就按最大扩大10倍算，数字最后会有不超过50位数。
 
 计算中，每计算一个数，得到另一个倒序的数，完全可以把它们看做相同的数，47和74，它们的计算步骤，结果完全相同。
 先计算了47，之后遇到74，完全可以用47的结果来标记它。
 XXXX 这招会导致错误的结果， 196是利克瑞尔数, 但6910不是，所以还是老老实实，一个一个数的计算。
 */

#import <Foundation/Foundation.h>
#define MAX_DIGITAL 10001
#define MAX_LENGTH  50

// 反转int
int reverseDigital(int digital) {
    int temp = 0;
    while (digital > 0) {
        temp = temp * 10 + digital % 10;
        digital /= 10;
    }
    return temp;
}

// 判断数组里面表示的数是否是回文数
BOOL isPalindrome(int* arr, int length) {
    while (length > 0 && arr[--length] == 0);
    if (length < 0) return NO;
    for (int i=length; i>(length-1)/2; i--) {
        if (arr[i] != arr[length-i]) {
            return NO;
        }
    }
    return YES;
}

// 将数组里面表示的数，加上它的反转的数
void reverseAndAdd(int *arr, int length) {
    while (length > 0 && arr[--length] == 0);
    if (length < 0) return;
    for (int i=length; i>(length-1)/2; i--) {
        arr[i] += arr[length-i];
        arr[length-i] = arr[i];
    }
    // 进位
    for (int i=0; i<=length; i++) {
        if (arr[i]>=10) {
            arr[i+1] += arr[i]/10;
            arr[i] %= 10;
        }
    }
}

void printArr(int *arr, int length) {
    for (int i=0; i<length; i++) {
        printf("%d", arr[i]);
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int number[MAX_LENGTH] = {0};
        int count = 0;
        
        for (int i=1; i<MAX_DIGITAL; i++) {
            memset(number, 0, sizeof(int) * MAX_LENGTH);
            int temp = i;
            int j=0;
            while (temp>0) {
                number[j++] = temp%10;
                temp /= 10;
            }
            temp = 1;
            for (j=0; j<MAX_LENGTH; j++) {
                reverseAndAdd(number, MAX_LENGTH);
                if (isPalindrome(number, MAX_LENGTH)) {
                    temp = 0;
                    break;
                }
            }
            if (temp==1) {
                count ++;
                printf("%d, ", i);
            }
        }
        
        printf("\n");
        printf("%d\n", count);
    }
    return 0;
}
