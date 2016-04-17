//
//  Person.m
//  runTimeTest
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Person


+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP)singFunction, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

void singFunction(id self, SEL cmd){
    NSLog(@"%@sing",[self valueForKey:@"name"]);
}

@end
