//
//  YDBaseSQLBuilder.m
//  YDSQLite
//
//  Created by rowena on 2018/11/15.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "YDBaseSQLBuilder.h"

@interface YDBaseSQLBuilder()
/** 全部SQL语句 */
@property (nonatomic, strong) NSMutableString *baseSql;

@end

@implementation YDBaseSQLBuilder

/**
 * 添加表名，由外部控制
 * @pram table 表名
 */
- (YDBaseSQLBuilder *)table:(NSString *)table {
    [self.baseSql appendString:table];
    [self.baseSql appendString:@" "];
    return self;
}

/**
 * 插入字段
 * @pram colums 需要插入的字段数组
 */
- (YDBaseSQLBuilder *)colums:(NSArray<NSString *> *)colums {
    for (NSInteger index = 0; index < [colums count]; index ++) {
        NSString *colum = [colums objectAtIndex:index];
        [self.baseSql appendString:colum];
        if (index < [colums count] - 1) {
            [self.baseSql appendString:@","];
        }
    }
    [self.baseSql appendString:@" "];
    return self;
}

/**
 * 添加专门针对值
 *
 */
- (YDBaseSQLBuilder *)values:(NSArray<id> *)values {
    return self;
}

/**
 * 处理类型，把不同的类型数据转换成字符串
 * @pram value 待处理类型
 */
- (void)appendValue:(id)value {
    //NSNull类型
    if ([value isMemberOfClass:[NSNull class]]) {
        
    } else if ([value isKindOfClass:[NSNumber class]]) {
        
    } else if ([value isKindOfClass:[NSString class]]) {
        
    }
}

#pragma mark -- get 函数
- (NSMutableString *)baseSql {
    if (!_baseSql) {
        _baseSql = [NSMutableString string];
    }
    return _baseSql;
}


@end
