//
//  CinemaViewController.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicViewController.h"
#import "Cinema.h"
#import "District.h"
@interface CinemaViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *cinema_dataArray;
@property (nonatomic,strong) NSMutableArray *district_dataArray;
@property (nonatomic,strong) Cinema *cinema;
@property (nonatomic,strong) District *district;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableDictionary *dic;

@end
