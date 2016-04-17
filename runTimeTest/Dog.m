//
//  Dog.m
//  runTimeTest
//
//  Created by mac on 16/4/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    Person *p = [[Person alloc] init];
    p.name = @"苍老师";
    [anInvocation invokeWithTarget:p];
}

@end
