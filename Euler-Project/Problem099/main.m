//
//  main.m
//  Problem099
//
//  Created by 张贵广 on 2018/09/28.
//  Copyright © 2018 GG. All rights reserved.
//

/*
 最大的幂
 
 比较两个如2^11和3^7这样写成幂的形式的数并不困难，任何计算器都能验证2^11 = 2048 < 3^7 = 2187。
 
 然而，想要验证632382^518061 > 519432^525806就会变得非常困难，因为这两个数都包含有超过三百万位数字。
 
 22K的文本文件base_exp.txt(https://projecteuler.net/project/resources/p099_base_exp.txt)（右击并选择“目标另存为……”）有一千行，每一行有一对底数和指数，找出哪一行给出的幂的值最大。
 
 注意：文件的前两行就是上述两个例子。
 
 ======================================
 
 通过计算发现：将底数从小到大排列起来，发现指数是从大到小
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:@"https://projecteuler.net/project/resources/p099_base_exp.txt"];
        NSString *input = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *lines = [input componentsSeparatedByString:@"\n"];
        NSMutableArray *exponentials = [NSMutableArray arrayWithCapacity:lines.count];
        [lines enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [exponentials addObject:[obj componentsSeparatedByString:@","]];
        }];
        
        [exponentials sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1[0] integerValue] > [obj2[0] integerValue];
        }];
        
        [exponentials enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%lu -> %@, %@", idx, obj[0], obj[1]);
        }];
    }
    return 0;
}
