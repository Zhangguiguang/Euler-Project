//
//  main.m
//  Euler Problem22
//
//  Created by 张贵广 on 16/8/1.
//  Copyright © 2016年 BKY. All rights reserved.
//

/*
 姓名得分
 在这个46K的文本文件names.txt（右击并选择“目标另存为……”）中包含了五千多个姓名。首先将它们按照字母序排列，然后计算出每个姓名的字母值，乘以它在按字母顺序排列后的位置，以计算出姓名得分。
 例如，按照字母序排列后，位于第938位的姓名COLIN的字母值是3 + 15 + 12 + 9 + 14 = 53。因此，COLIN的姓名得分是938 × 53 = 49714。
 文件中所有姓名的姓名得分之和是多少？
 */

/*
 OC数组自带排序功能，简直不要太简单
 sum = 871198282
 */

#import <Foundation/Foundation.h>

int score(NSString *name, int order) {
    int length = (int)name.length;
    int sum = 0;
    for (int i=0; i<length; i++) {
        sum += [name characterAtIndex:i];
    }
    sum -= (length * ('A'-1));
    //    NSLog(@"order = %4d, sum = %3d, score = %6d, string = %@", order, sum, order*sum, name);
    return sum*order;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *urlString = @"http://projecteuler.net/project/resources/p022_names.txt";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        NSMutableString *string = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        // 去引号
        [string replaceOccurrencesOfString:@"\"" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, string.length)];
        
        // 分词
        NSMutableArray *array = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@","]];
        
        // 排序
        [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        
        long sum = 0;
        NSInteger count = array.count;
        for (int i=0; i<count; i++) {
            sum += score(array[i], i+1);
        }
        
        NSLog(@"sum = %ld", sum);
    }
    return 0;
}
