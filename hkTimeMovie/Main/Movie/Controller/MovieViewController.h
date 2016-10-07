//
//  MovieViewController.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicViewController.h"
#import "PosterView.h"
@interface MovieViewController : BasicViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tab;
@property (nonatomic,strong) PosterView *posterView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
