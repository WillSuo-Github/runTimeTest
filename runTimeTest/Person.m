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
    
    [anInvocation setSelector:@selector(dance)];
    [anInvocation invokeWithTarget:self];
    
}

- (void)dance{
    
    NSLog(@"跳舞了");
}
@end
