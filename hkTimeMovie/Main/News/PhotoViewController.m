//
//  PhotoViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/6.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
@interface PhotoViewController ()
{
    BOOL _isHide;
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction)];
    self.navigationItem.leftBarButtonItem = button;
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    collectionView.pagingEnabled = YES;
    collectionView.imageURL = _imageURL;
    [collectionView scrollToItemAtIndexPath:_indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    [self.view addSubview:collectionView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickAction) name:@"notificationCenter" object:nil];
    _isHide = NO;
}

-(void)clickAction
{
    _isHide = !_isHide;
    [self.navigationController setNavigationBarHidden:_isHide animated:YES];
}

-(void)buttonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
