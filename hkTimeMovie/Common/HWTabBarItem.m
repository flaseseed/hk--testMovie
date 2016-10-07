//
//  HWTabBarItem.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "HWTabBarItem.h"

@implementation HWTabBarItem

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)name title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20) / 2, 5, 20, 20)];
        imageView.image = [UIImage imageNamed:name];
        //自适应图片大小
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frame.size.width, 20)];
        titleLable.text = title;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.textColor = [UIColor whiteColor];
        titleLable.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:imageView];
        [self addSubview:titleLable];
    }
    return self;
}

@end
