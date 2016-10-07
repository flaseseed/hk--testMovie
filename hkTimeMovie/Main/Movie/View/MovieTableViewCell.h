//
//  MovieTableViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/2.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@class StarView;
@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;
@property (nonatomic,strong) Movie *movie;
@property (weak, nonatomic) IBOutlet StarView *starview;
@end
