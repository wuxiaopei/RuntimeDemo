//
//  Receiver.m
//  RuntimeDemo
//
//  Created by wupei on 2017/6/22.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "Receiver.h"
#import <objc/runtime.h>
#import "StepMother.h"

// 要被动态添加的方法
void kedouMotherIMP(id self, SEL _cmd){
    NSLog(@"我是程序员使用动态方法解析，人工培育的蝌蚪妈妈");
}

@implementation Receiver

// 补救第一步：动态解析方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod");

    //如果这个 sel  是需要动态添加的 （也就是小蝌蚪的妈妈是我们人工培育的）
    if (sel == @selector(kedouMotherResolveMethod)) {//这里只是判断方法名,也就是小蝌蚪消息里面的方法名
        //把实现方法和消息的里面的方法
        class_addMethod([self class], sel, (IMP)kedouMotherIMP , "@");
        // 返回 YES 后， Runtime 重新给对象发送 kedouMother 消息，这次就可以找到 kedouMotherIMP 方法实现并调用它了
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

// 补救第二步：重定向

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardInvocation");
    
    if (aSelector == @selector(kedouMotherRedirectMethod)) {//这里只是判断方法名,也就是小蝌蚪消息里面的方法名
        
        // 返回另外一个对象，让它去接收该消息
        return [[StepMother alloc] init];
    }
    return  [super forwardingTargetForSelector:aSelector];
}

#pragma mark -- 第三次补救：消息转发

//获取一个方法签名，用于生成 NSInvocation
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector");
    
    if ([NSStringFromSelector(aSelector) isEqualToString:@"kedouMotherforwardMethod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//补救第三步：消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    //如果另外一个对象 stepMother 可以响应该方法
    if ([[[StepMother alloc] init] respondsToSelector:[anInvocation selector]]) {
        // 则让另一个对象来响应该方法
        [anInvocation invokeWithTarget:[[StepMother alloc] init]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

// 如果没有方法实现，会调用这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"消息无法处理：%@", NSStringFromSelector(aSelector));
}

@end
