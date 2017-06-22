//
//  ViewController.m
//  RuntimeDemo
//
//  Created by wupei on 2017/6/22.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "ViewController.h"
#import "Receiver.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)callResolveMethodBtnClick:(id)sender {
    
    Receiver *receiver = [[Receiver alloc] init];
    [receiver kedouMotherResolveMethod];
   
    NSLog(@"is receiver response to selector %@? %@", @"kedouMotherResolveMethod", [receiver respondsToSelector:@selector(kedouMotherResolveMethod)] ? @"YES" : @"NO");
}

- (IBAction)callRedirectMethodBtnClick:(id)sender {
    Receiver *receiver = [[Receiver alloc] init];
    [receiver kedouMotherRedirectMethod];

    NSLog(@"is receiver response to selector %@? %@", @"kedouMotherRedirectMethod", [receiver respondsToSelector:@selector(kedouMotherRedirectMethod)] ? @"YES" : @"NO");
}

- (IBAction)callRorwardMethodBtnClick:(id)sender {
    Receiver *receiver = [[Receiver alloc] init];
    [receiver kedouMotherforwardMethod];
    
    NSLog(@"is receiver response to selector %@? %@", @"kedouMotherforwardMethod", [receiver respondsToSelector:@selector(kedouMotherforwardMethod)] ? @"YES" : @"NO");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
