//
//  main.m
//  Problem014
//
//  Created by 张贵广 on 15/9/20.
//  Copyright (c) 2015年 HZNU. All rights reserved.
//
/*
 
 最长考拉兹序列
 
 在正整数集上定义如下的迭代序列：
 
 n → n/2 （若n为偶数）
 n → 3n + 1 （若n为奇数）
 
 从13开始应用上述规则，我们可以生成如下的序列：
 
 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 可以看出这个序列（从13开始到1结束）共有10项。尽管还没有被证明，但我们普遍认为，从任何数开始最终都能迭代至1（“考拉兹猜想”）。
 
 从小于一百万的哪个数开始，能够生成最长的序列呢？
 
 注意： 序列开始生成后允许其中的项超过一百万。
 
 // 毫无疑问，当然要从1循环到999999，每一个数字都计算它到1所需经过的序列，然后比较找出最长序列对应的数。
 // 但是数字越大，经历的计算越多，每个数字都从它本身计算到1，肯定要花销很多时间。
 // 可以用999999位数组，把从1-999999的所有数字计算到1需要的步数存起来，
 // 而计算每个数n过程中，每得到一个新数x，可在数组中查询，x是否可以计算到达1，如果可以，n当前已计算的步数加x的步数便是n需要计算的步数，否则再计算下一个x。
 
 // 运行结果 max step = 525
 // 。。。这个结果很坑啊，没注意看题，以为是求最大步数
 // 不过在网上找答案时，学到了一个小技巧，i%2 可以用 i&1 来代替，位运算比模运算要快，提高效率，同理，i/2也可以用i>>1代替
 // 既然已经找出max step = 525 了，可以判断当step==525时，输出数字
 // 运算结果 num = 837799 max step = 525
 
 */

#import <Foundation/Foundation.h>

#define MAX_NUM 999999

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"start");
        unsigned int steps[MAX_NUM];
        // 先初始化所有元素为0
        for (int i=0; i<MAX_NUM; i++) {
            steps[i] = 0;
        }
        
        unsigned int currentNum;
        unsigned int currentStep;
        unsigned int maxStep = 0;
        for (int i=1; i<=MAX_NUM; i++) {
            currentNum = i;
            currentStep = 1;
            while (currentNum != 1) {
                if ((currentNum & 1) == 0) {
                    currentNum >>= 1;
                } else {
                    currentNum = currentNum * 3 + 1;
                }
                
                // 判断一下计算出来的数字之前是否计算过
                // 如果计算过，直接得出currentStep，并退出循环
                if (currentNum <= MAX_NUM && steps[currentNum-1]) {
                    currentStep += (steps[currentNum-1]);
                    break;
                }
                
                currentStep ++;
            }
            
            // 一个数字计算结束，数字对应元素step值设为currentStep
            steps[i-1] = currentStep;
            if (currentStep > maxStep) {
                maxStep = currentStep;
                // 既然找到了最大步数为525，判断最大步数为525时，输出那个数字
                if (maxStep == 525) {
                    NSLog(@"num = %i", i);
                }
            }
        }
        
        NSLog(@"max step = %i", maxStep);
        
    }
    return 0;
}
