# RuntimeModel
自定义model自动赋值

在给model初始化赋值时，将字典数据与model定义的属性名映射赋值。       

如果key和model属性名对不上，需要model自身维护一个映射关系，- (NSDictionary *)propertyMapDic；
