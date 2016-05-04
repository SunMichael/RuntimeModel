//
//  BaseModel.m
//  RuntimeModel
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 treebear. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

+(instancetype) modelWithDictionary:(NSDictionary *)dic{
    return [[self alloc] initWithDictionary:dic];
}

-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        if ([self propertyMapDic] == nil) {
           [self assignToPropertyWithDictionary:dic];
        }else{
            [self assignToPropertyWithNoMapDictionary:dic];
        }
    }
    return self;
}

-(SEL)creatSetterWithPropertyName:(NSString *)name{
    name = name.capitalizedString;
    name = [NSString stringWithFormat:@"set%@:",name];
    
    return NSSelectorFromString(name);
}

- (void)assignToPropertyWithDictionary:(NSDictionary *)dic{
    if (dic == nil) {
        return;
    }
    NSArray *dicKey = dic.allKeys;
    for (int i =0 ; i < dicKey.count; i++) {
        SEL setSel = [self creatSetterWithPropertyName:dicKey[i]];
        if ([self respondsToSelector:setSel]) {
            NSString *value = [NSString stringWithFormat:@"%@",dic[dicKey[i]]];
            [self performSelectorOnMainThread:setSel withObject:value waitUntilDone:[NSThread isMainThread]];
        }
    }
}

-(NSArray *)allPropertyNames{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int propertyCount = 0 ;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    for (int i =0;  i< propertyCount; i++) {
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        [array addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertys);
    return array;
}

-(SEL)creatGetterWithPropertyName:(NSString *)name{
    return NSSelectorFromString(name);
}

-(void)dispalyCurrentModleProperty{
    NSArray *array = [self allPropertyNames];
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        SEL getSel = [self creatGetterWithPropertyName:array[i]];
        if ([self respondsToSelector:getSel]) {
            NSMethodSignature *signature = [self methodSignatureForSelector:getSel];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:self];
            [invocation setSelector:getSel];
            
            NSObject *__unsafe_unretained returnValue = nil;
            [invocation invoke];
            [invocation getReturnValue:&returnValue];
            [resultString appendFormat:@"%@\n",returnValue];
        }
    }
    NSLog(@" %@",resultString);
}

//model自己维护一个字典映射 ,  将不对应的model属性和key对应起来
- (NSDictionary *)propertyMapDic{
    return  nil;
}

- (void)assignToPropertyWithNoMapDictionary:(NSDictionary *)dic{
    NSDictionary *propertyMapDic = [self propertyMapDic];
    NSArray *dicKey = dic.allKeys;
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    for (int i = 0; i<dicKey.count; i++) {
        NSString *key = dicKey[i];
        [tempDic setObject:dic[key] forKey:propertyMapDic[key]];
    }
    [self assignToPropertyWithDictionary:tempDic];
}


@end
