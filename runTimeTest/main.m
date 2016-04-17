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
#import "Person.h"

void sayFunction (id self,SEL _cmd,id some){
    
    
    NSLog(@"%@--%@:%@",object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"_name"],some);
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        
//        Person *p = [[Person alloc] init];
//        p.age = 18;
//        p.name = @"李彦科";
        
        NSDictionary *dict = @{
                               @"name" : @"苍井空",
                               @"age"  : @18,
                               };

        Person *p = [[Person alloc] initWithDic:dict];
        NSLog(@"%@--%@",p.name,p.age);
        NSLog(@"%@",p.keyValues);
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
