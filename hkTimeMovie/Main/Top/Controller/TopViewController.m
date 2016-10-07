//
//  TopViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "TopViewController.h"
#import "TopCollectionViewCell.h"
#import "HWDataService.h"
#import "TopDetailViewController.h"

static NSString *identify = @"cell";

@interface TopViewController ()
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _requestData];
    [self _creatCollection];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

-(void)_creatCollection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat width = kScreenWidth / 3.5;
    flowLayout.itemSize = CGSizeMake(width, width * 1.7);    
    
    _col = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, kScreenHeight - 20) collectionViewLayout:flowLayout];
    _col.delegate = self;
    _col.dataSource = self;
    _col.backgroundColor = [UIColor clearColor];
    
    //自定义cell用nib方法注册
    //用xib需要注册，用storyboard不需要注册
    [_col registerNib:[UINib nibWithNibName:@"TopCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identify];
    
    [self.view addSubview:_col];
}

-(void)_requestData
{
    NSDictionary *dic = [HWDataService DataService:@"top250.json"];
    NSArray *subjects = [dic objectForKey:@"subjects"];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (NSDictionary *detailDic in subjects) {
        Top *top = [[Top alloc]init];
        top.title = detailDic[@"title"];
        top.average = [[detailDic objectForKey:@"rating"] objectForKey:@"average"];
        top.images = [[detailDic objectForKey:@"images"] objectForKey:@"medium"];
        
        [_dataArray addObject:top];
    }
    [_col reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.top = _dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailViewController *topDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"TopDetailViewController"];
    [self.navigationController pushViewController:topDetail animated:YES];
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
