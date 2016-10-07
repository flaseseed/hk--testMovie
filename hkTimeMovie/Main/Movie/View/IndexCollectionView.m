//
//  IndexCollectionView.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/9.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionViewCell.h"
@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[IndexCollectionViewCell class] forCellWithReuseIdentifier:@"indexCell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexCell" forIndexPath:indexPath];
    cell.movie = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.current != indexPath.row)
    {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    self.current = (int)indexPath.row;
    
}

@end
