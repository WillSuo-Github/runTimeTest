//
//  Person.h
//  runTimeTest
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;

- (void)sing;
- (void)dance;
@end
