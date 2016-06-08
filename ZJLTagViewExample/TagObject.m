//
//  TagObject.m
//  ZJLTagViewExample
//
//  Created by ZhongZhongzhong on 16/6/8.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "TagObject.h"

@implementation TagObject

- (instancetype)initWithTagName:(NSString *)name
{
    if(self=[super init]){
        _name = [name copy];
    }
    return self;
}

- (NSString *)tagName
{
    return self.name?self.name:@"name undefined";
}
@end
