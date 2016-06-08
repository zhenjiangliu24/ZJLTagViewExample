//
//  TagObject.h
//  ZJLTagViewExample
//
//  Created by ZhongZhongzhong on 16/6/8.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagObject : NSObject<ZJLTagListViewObject>
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithTagName:(NSString *)name;
@end
