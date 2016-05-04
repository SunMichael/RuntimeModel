//
//  main.m
//  RuntimeModel
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 treebear. All rights reserved.
//

#import "BaseModel.h"
#import "BoyModel.h"
#import <Foundation/Foundation.h>

int main(int argc, const char* argv[])
{
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        NSMutableDictionary* data = [[NSMutableDictionary alloc] initWithCapacity:11];

        //创建测试适用的字典
        for (int i = 0; i <= 10; i++) {
            NSString* key = [NSString stringWithFormat:@"girl%d", i];

            NSString* value = [NSString stringWithFormat:@"我是第%d个女孩", i];

            [data setObject:value forKey:key];
        }
        BaseModel* model = [BaseModel modelWithDictionary:data];
        NSLog(@" %@", model.girl3);
        [model dispalyCurrentModleProperty];

        //json key和 model 属性名不一致的情况
        BoyModel* boyModel = [BoyModel modelWithDictionary:@{ @"key1" : @"xiaoming",
            @"key2" : @"20",
            @"key3" : @"beijing",
            @"key4" : @"sanlitun" }];
        [boyModel dispalyCurrentModleProperty];
    }
    return 0;
}
