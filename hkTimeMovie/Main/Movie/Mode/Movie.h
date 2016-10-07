//
//  Movie.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/2.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic,strong) NSNumber *average;    //评分
@property (nonatomic,copy) NSString *title;    //标题
@property (nonatomic,copy) NSString *original_title;   //原标题
@property (nonatomic,copy) NSString *subtype;    //种类
@property (nonatomic,copy) NSString *year;    //年份
@property (nonatomic,copy) NSDictionary *images;    //图片
@property (nonatomic,copy) NSString *movieID;    //id
@property (nonatomic,strong) NSNumber *collect_count;   //收藏人数

@end
