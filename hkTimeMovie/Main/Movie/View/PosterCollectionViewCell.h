//
//  PosterCollectionViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/7.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@class MovieDetailView;
@interface PosterCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) Movie *movie;
@property (nonatomic,strong) MovieDetailView *detailView;
@property (nonatomic,assign) BOOL flag;
-(void)flip;
@end
