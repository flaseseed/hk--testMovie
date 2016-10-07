//
//  ImageListCollectionViewCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageList.h"
@interface ImageListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic,strong) ImageList *imagelist;
@end
