//
//  StarView.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/2.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "StarView.h"

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self creatStar];
    }
    return self;
}

-(void)awakeFromNib
{
    [self creatStar];
}

-(void)setRating:(float)rating
{
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    _rating = rating;
    CGFloat s = rating / 10.0;
    CGFloat width = self.frame.size.width * s;
    CGRect frame = _yellow.frame;
    frame.size.width = width;
    _yellow.frame = frame;
}

-(void)creatStar
{
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
        
    _gray = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _gray.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_gray];
    
    _yellow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImg.size.width * 5, yellowImg.size.height)];
    _yellow.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellow];
    CGFloat starWith = self.bounds.size.height * 5;
    CGRect frame = self.frame;
    frame.size.width = starWith;
    self.frame = frame;
    
    CGFloat scale = self.frame.size.height / _yellow.frame.size.height;
    
    _yellow.transform = CGAffineTransformMakeScale(scale, scale);
    _gray.transform = CGAffineTransformMakeScale(scale, scale);
    
    CGRect  f1 = _yellow.frame;
    CGRect f2 = _gray.frame;
    f1.origin = CGPointMake(0, 0);
    f2.origin = CGPointMake(0, 0);
    _yellow.frame = f1;
    _gray.frame = f2;
    
}
@end
