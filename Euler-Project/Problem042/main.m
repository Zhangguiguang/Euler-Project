//
//  main.m
//  Problem042
//
//  Created by 张贵广 on 8/2/16.
//  Copyright © 2016 GG. All rights reserved.
//

/*
 编码三角形数
 
 三角形数序列的第n项由公式tn = 1/2n(n+1)给出；因此前十个三角形数是：
 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, …
 将一个单词的每个字母分别转化为其在字母表中的顺序并相加，我们可以计算出一个单词的值。例如，单词SKY的值就是 19 + 11 + 25 = 55 = t10。如果一个单词的值是一个三角形数，我们就称这个单词为三角形单词。
 在这个16K的文本文件words.txt （右击并选择“目标另存为……”）中包含有将近两千个常用英文单词，这其中有多少个三角形单词？
 https://projecteuler.net/project/resources/p042_words.txt
 */

/*
 假设一个单词最多25位，而每位最大为Z(26), 那么单词的最大值 = 25*26 = 650
 所以做比较的三角形数最大不超过650
 先创建一个数组 flag[650] = {0};
 先把小于650的三角形数对应的下标都设置为1
 再遍历每一个单词，得出单词的值x
 让 count += flag[x]，直到遍历结束
 
 count = 162
 // 如果运行缓慢，不要怀疑程序的性能，大量的时间被网络占用了
 */

#import <Foundation/Foundation.h>
#define MAX_TRIANGLE_NUMBER 650

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int flag[MAX_TRIANGLE_NUMBER] = {0};
        int num = 0;
        for (int n=1; (num=n*(n+1)/2)<=650; n++) {
            flag[num] = 1;
        }
        
        // 直接把Problem22的代码拷贝过来。。
        NSString *urlString = @"http://projecteuler.net/project/resources/p042_words.txt";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        NSMutableString *string = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        // 去引号
        [string replaceOccurrencesOfString:@"\"" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, string.length)];
        // 分词
        NSMutableArray *array = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@","]];
        
        int count = 0;
        for (NSString *word in array) {
            // 计算单词的值
            NSInteger length = word.length;
            int sum = 0;
            for (int i=0; i<length; i++) {
                sum += [word characterAtIndex:i];
            }
            sum -= ('A'-1)*length;
            count += flag[sum];
            //            if (flag[sum]) {
            //                NSLog(@"%3d, %@", sum, word);
            //            }
        }
        NSLog(@"count = %d", count);
    }
    return 0;
}
