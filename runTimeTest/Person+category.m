//
//  Person+category.m
//  runTimeTest
//
//  Created by mac on 16/4/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Person+category.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Person (category)

- (void)setBust:(NSNumber *)bust{
    
    objc_setAssociatedObject(self, @selector(bust), bust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)bust{
    
    return objc_getAssociatedObject(self, @selector(bust));
}

- (void)setBlock:(void (^)())block{
    
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (void (^)())block{
    
    return objc_getAssociatedObject(self, @selector(block));
}

@end
