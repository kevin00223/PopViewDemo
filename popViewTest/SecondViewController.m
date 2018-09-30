//
//  SecondViewController.m
//  popViewTest
//
//  Created by 李凯 on 2018/9/28.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "SecondViewController.h"
#import "PopViewCell.h"
#import "PopView.h"
#import "Masonry.h"

@interface SecondViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) PopView *popView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"shareImage"] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(rightBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)rightBtnOnClick: (UIButton *)sender {
    if (!sender.isSelected) {
        sender.selected = YES;
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:self.maskView];
        [UIView animateWithDuration:0.3 animations:^{
            self.popView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
        }];
        [self.popView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.right.offset(-10);
            make.width.offset(160);
            make.height.offset(79);
        }];
    }else{
        sender.selected = NO;
        [self dismiss];
    }
}

- (void)tapGesture: (UITapGestureRecognizer *)gesture {
    self.rightBtn.selected = NO;
    [self dismiss];
}

- (void)dismiss {
    [UIView animateWithDuration:0.1 animations:^{
        self.popView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
    }];
}

- (PopView *)popView {
    if (!_popView) {
        _popView = [[PopView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _popView.dataArray = @[@{@"icon": @"friendsCircle", @"textLabel": @"分享该名片"},
                               @{@"icon": @"qqCircle", @"textLabel": @"投诉"}];
    }
    return _popView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        _maskView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        [_maskView addSubview:self.popView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        tap.delegate = self;
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}

// 父试图添加手势 导致子视图的cell点击无效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

@end
