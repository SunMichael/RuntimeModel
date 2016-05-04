//
//  BoyModel.h
//  RuntimeModel
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 treebear. All rights reserved.
//

#import "BaseModel.h"

@interface BoyModel : BaseModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *location;  //model属性名和 json数据key不对应

@property (nonatomic, copy) NSString *home;   //此处是model属性和 json数据key相同

- (NSDictionary *)propertyMapDic;

@end
