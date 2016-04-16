//
//  main.m
//  runTimeTest
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>

void sayFunction (id self,SEL _cmd,id some){
    
    
    NSLog(@"%@--%@:%@",object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"_name"],some);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Class People = objc_allocateClassPair([NSObject class], "Person", 0);
        class_addIvar(People, "_name", sizeof(NSString *), sizeof(NSString *), @encode(NSString *));
        class_addIvar(People, "_age", sizeof(NSInteger), sizeof(NSInteger), @encode(NSInteger));
        
        SEL s = sel_registerName("say:");
        class_addMethod(People, s, (IMP)sayFunction, "v@:@");
        
        objc_registerClassPair(People);
        
        id peopleInstance = [[People alloc] init];
        
        [peopleInstance setValue:@"苍老师" forKey:@"name"];
        
        Ivar getIvar = class_getInstanceVariable(People, "_age");
        object_setIvar(peopleInstance, getIvar, @18);
        
        ((void(*)(id,SEL,id))objc_msgSend)(peopleInstance,s,@"大叫好");
        
        peopleInstance = nil;
        objc_disposeClassPair(People);
        
        
        
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
