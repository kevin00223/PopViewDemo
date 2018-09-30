//
//  PopView.m
//  popViewTest
//
//  Created by 李凯 on 2018/9/29.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import "PopView.h"
#import "PopViewCell.h"

static NSString *popViewCellID = @"popViewCellID";
@implementation PopView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = 40;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
        [self registerNib:[UINib nibWithNibName:@"PopViewCell" bundle:nil] forCellReuseIdentifier:popViewCellID];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:popViewCellID];
    if (!cell) {
        cell = [[PopViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:popViewCellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    NSDictionary *modelDic = self.dataArray[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:modelDic[@"icon"]];
    cell.titleTextLabel.text = modelDic[@"textLabel"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *hitTestView = [super hitTest:point withEvent:event];
//    
//    CGPoint newP = [self convertPoint:point toView:self];
//    if ([self pointInside:newP withEvent:event]) {
//        return self;
//    }else{
//        return hitTestView.superview;
//    }
//    
////    CALayer *hitTestLayer = hitTestView.layer.presentationLayer;
////    if (CGRectContainsPoint(hitTestLayer.frame, point)) {
////        return hitTestView;
////    }else{
////        return hitTestView.superview;
////    }
//}


@end
