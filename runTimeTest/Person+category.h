//
//  Person+category.h
//  runTimeTest
//
//  Created by mac on 16/4/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Person.h"

@interface Person (category)

@property (nonatomic, strong) NSNumber *bust;

@property (nonatomic, copy) void(^block)();

@end
