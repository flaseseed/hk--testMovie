//
//  NewsViewController.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicViewController.h"
@class News;
@interface NewsViewController : BasicViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) News *news;
@property (nonatomic,copy) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
