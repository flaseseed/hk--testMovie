//
//  NewsTableViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/3.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.text = _news.title;
    _summaryLabel.text = _news.summary;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_news.image]];
    if ([_news.type integerValue] == 0) {
        _iconView.hidden = YES;
        CGRect frame = _summaryLabel.frame;
        frame.origin.x = CGRectGetMaxX(_imgView.frame) + 15;
        _summaryLabel.frame = frame;
    }
    else if([_news.type integerValue] == 1)
    {
        _iconView.image = [UIImage imageNamed:@"sctpxw"];
        _iconView.hidden = NO;
        CGRect frame = _summaryLabel.frame;
        frame.origin.x = CGRectGetMaxX(_iconView.frame) + 5;
        _summaryLabel.frame = frame;
    }
    else if([_news.type integerValue] == 2)
    {
        _iconView.image = [UIImage imageNamed:@"scspxw"];
        _iconView.hidden = NO;
        CGRect frame = _summaryLabel.frame;
        frame.origin.x = CGRectGetMaxX(_iconView.frame) + 5;
        _summaryLabel.frame = frame;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
