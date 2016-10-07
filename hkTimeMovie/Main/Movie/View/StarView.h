//
//  StarView.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/2.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface StarView : UIView

@property (nonatomic,strong) UIView *yellow;
@property (nonatomic,strong) UIView *gray;
//@property (nonatomic,strong) Movie *movie;
@property (nonatomic,assign) float rating;
@end
