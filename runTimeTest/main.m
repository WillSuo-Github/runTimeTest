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
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
