//
//  UIViewController+CountViewController.m
//  runTimeTest
//
//  Created by 岩柯李 on 2016/11/7.
//  Copyright © 2016年 mac. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+CountViewController.h"

@implementation UIViewController (CountViewController)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSel = @selector(viewWillAppear:);
        SEL swizzledSel = @selector(ws_viewWillAppear:);
        Class cls = [self class];
        Method originalMethod = class_getInstanceMethod(cls, originalSel);
        Method swizzledMethod = class_getInstanceMethod(cls, swizzledSel);
        BOOL isAddSuccess = class_addMethod(cls, originalSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        NSLog(@"%d",isAddSuccess);
//        if (isAddSuccess) {
//            class_replaceMethod(cls, swizzledSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        }
        if (isAddSuccess) {
            class_replaceMethod(cls,
                                swizzledSel,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
         
    });
}

- (void)ws_viewWillAppear:(BOOL)animated{
    NSLog(@"111");
}

@end
