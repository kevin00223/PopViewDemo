//
//  ViewController.m
//  popViewTest
//
//  Created by 李凯 on 2018/9/28.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.btn.frame = CGRectMake(100, 100, 40, 40);
    [self.btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
//    UIEvent *event = [UIEvent new];
//    [self.btn pointInside:CGPointMake(20, 30) withEvent:event];
}

- (void)btnOnClick {
    SecondViewController *secVC = [SecondViewController new];
    [self.navigationController pushViewController:secVC animated:YES];
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"click" forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor orangeColor]];
    }
    return _btn;
}



@end
