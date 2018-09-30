//
//  PopView.h
//  popViewTest
//
//  Created by 李凯 on 2018/9/29.
//  Copyright © 2018年 李凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *dataArray;

@end
