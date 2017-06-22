//
//  StepMother.m
//  RuntimeDemo
//
//  Created by wupei on 2017/6/22.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "StepMother.h"

@implementation StepMother


- (void)kedouMotherRedirectMethod {
    NSLog(@"StepMother kedouMotherRedirectMethod");
    NSLog(@"我是程序员使用重定向方法，人工培育的蝌蚪妈妈");
}

- (void)kedouMotherforwardMethod {
    NSLog(@"StepMother kedouMotherforwardMethod");
    NSLog(@"我是程序员使用消息转发，人工培育的蝌蚪妈妈");
}

@end
