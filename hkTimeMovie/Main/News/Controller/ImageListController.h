//
//  ImageListController.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "BasicViewController.h"

@interface ImageListController : BasicViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *NewsListCollection;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
