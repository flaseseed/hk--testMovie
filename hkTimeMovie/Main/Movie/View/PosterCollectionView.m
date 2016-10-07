//
//  PosterCollectionView.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/7.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCollectionViewCell.h"
@implementation PosterCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:@"posterCell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"posterCell" forIndexPath:indexPath];
    cell.movie = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCollectionViewCell *cell = (PosterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.current != indexPath.row)
    {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    else
    {
        [cell flip];
    }
    self.current = (int)indexPath.row;
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCollectionViewCell *cell2 = (PosterCollectionViewCell *)cell;
    if (cell2.flag == NO) {
        [cell2 flip];
    }
}

@end
