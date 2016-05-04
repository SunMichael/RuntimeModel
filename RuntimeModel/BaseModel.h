//
//  BaseModel.h
//  RuntimeModel
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 treebear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, copy) NSString *girl0;
@property (nonatomic, copy) NSString *girl1;
@property (nonatomic, copy) NSString *girl2;
@property (nonatomic, copy) NSString *girl3;
@property (nonatomic, copy) NSString *girl4;
@property (nonatomic, copy) NSString *girl5;
@property (nonatomic, copy) NSString *girl6;
@property (nonatomic, copy) NSString *girl7;
@property (nonatomic, copy) NSString *girl8;
@property (nonatomic, copy) NSString *girl9;
@property (nonatomic, copy) NSString *girl10;

-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(instancetype) modelWithDictionary:(NSDictionary *)dic;


-(void)dispalyCurrentModleProperty;
- (NSDictionary *)propertyMapDic;
@end
