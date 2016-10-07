//
//  PhotoCollectionViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/6.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy) NSString *imgurl;
@property (nonatomic,strong) PhotoScrollView *scroll;
@end
