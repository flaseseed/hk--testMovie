//
//  News.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/3.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) NSNumber *type;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *image;

@end
