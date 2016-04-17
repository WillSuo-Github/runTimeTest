//
//  Person.h
//  runTimeTest
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>{
    
    NSString *_occ;
    NSString *_nat;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;



@end
