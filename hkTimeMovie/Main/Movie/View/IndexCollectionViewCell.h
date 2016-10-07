//
//  IndexCollectionViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/9.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface IndexCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) Movie *movie;

@end
