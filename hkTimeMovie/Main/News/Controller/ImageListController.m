//
//  ImageListController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "ImageListController.h"
#import "ImageListCollectionViewCell.h"
#import "HWDataService.h"
#import "ImageList.h"
#import "PhotoViewController.h"
#import "HWNavigationController.h"

@interface ImageListController ()

@end

@implementation ImageListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    _NewsListCollection.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    // Do any additional setup after loading the view.
}

-(void)requestData
{
    NSArray *array = [HWDataService DataService:@"image_list.json"];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (NSDictionary *dic in array) {
        ImageList *imagelist = [[ImageList alloc]init];
        imagelist.image = dic[@"image"];
        [_dataArray addObject:imagelist];
    }
    [_NewsListCollection reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newslistcell" forIndexPath:indexPath];
    cell.imagelist = _dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *photoVc = [[PhotoViewController alloc]init];
    
    photoVc.imageURL = [[NSMutableArray alloc]initWithCapacity:5];
    for (int i = 0; i < _dataArray.count; ++i) {
        ImageList *imagelist = [[ImageList alloc]init];
        imagelist = _dataArray[i];
        [photoVc.imageURL addObject:imagelist.image];
        photoVc.indexpath = indexPath;
    }
    HWNavigationController *navigationVc = [[HWNavigationController alloc]initWithRootViewController:photoVc];
    [self presentViewController:navigationVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
