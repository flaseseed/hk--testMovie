//
//  NewsTableViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/3.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "UIImageView+WebCache.h"

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) News *news;

@end
