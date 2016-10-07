//
//  Cinema.h
//  hkTimeMovie
//
//  Created by 看着太阳吃烧饼 on 15/11/10.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : BaseModel

@property (nonatomic,copy) NSString *lowPrice;
@property (nonatomic,copy) NSString *grade;
@property (nonatomic,copy) NSString *coord;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSString *districtId;
@property (nonatomic,copy) NSString *tel;
@property (nonatomic,copy) NSString *isSeatSupport;
@property (nonatomic,copy) NSString *isCouponSupport;
@property (nonatomic,copy) NSString *isImaxSupport;
@property (nonatomic,copy) NSString *isGroupBuySupport;
@property (nonatomic,copy) NSString *circleName;

@end
