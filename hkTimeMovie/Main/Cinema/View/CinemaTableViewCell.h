//
//  CinemaTableViewCell.h
//  hkTimeMovie
//
//  Created by 看着太阳吃烧饼 on 15/11/10.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"
#import "District.h"
@interface CinemaTableViewCell : UITableViewCell
@property (nonatomic,strong) Cinema *cinema;
@property (nonatomic,strong) District *district;
@property (weak, nonatomic) IBOutlet UILabel *CinemaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *isSeatLabel;
@property (weak, nonatomic) IBOutlet UILabel *isCouponLabel;

@end
