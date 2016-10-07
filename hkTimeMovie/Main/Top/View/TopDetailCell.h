//
//  TopDetailCell.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/6.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetail.h"
@interface TopDetailCell : UITableViewCell

@property (nonatomic,strong) TopDetail *topDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
