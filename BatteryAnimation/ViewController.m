//
//  ViewController.m
//  BatteryAnimation
//
//  Created by clou on 16/4/22.
//  Copyright © 2016年 sculg. All rights reserved.
//

#import "ViewController.h"
#import "BatteryChargeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //只需要下面两行代码即可以增加该动画
    BatteryChargeView *my = [[BatteryChargeView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:my];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
