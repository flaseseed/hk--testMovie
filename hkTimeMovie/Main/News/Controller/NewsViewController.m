//
//  NewsViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "HWDataService.h"
#import "NewsTableViewCell.h"
#import "NewsDetailController.h"
#import "ImageListController.h"

@interface NewsViewController ()
@property (nonatomic,strong) UIView *header;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTable];
    [self _requestData];
    [self creatHeaderView];

}

-(void)_creatTable
{
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

-(void)creatHeaderView
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    [self.view addSubview:_imgView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 150 - 30, kScreenWidth, 30)];
    _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_titleLabel];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
        News *news = _dataArray[indexPath.row];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        _titleLabel.text = news.title;
//        UIImageView *image = (UIImageView *)[cell.contentView viewWithTag:100];
//        UILabel *lable = (UILabel *)[cell.contentView viewWithTag:101];
//        News *news = _dataArray[indexPath.row];
//        lable.text = news.title;
//        lable.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
//        [image sd_setImageWithURL:[NSURL URLWithString:news.image]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reguilarCell" forIndexPath:indexPath];
    cell.news = _dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    return 60;
}

-(void)_requestData
{
    NSArray *array = [HWDataService DataService:@"news_list.json"];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (NSDictionary *dic in array) {
        _news = [[News alloc]init];
        _news.title = [dic objectForKey:@"title"];
        _news.summary = dic[@"summary"];
        _news.type = dic[@"type"];
        _news.image = dic[@"image"];
        [_dataArray addObject:_news];
    }
    [_tableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 0) {
        _imgView.transform = CGAffineTransformMakeTranslation(0, -offsetY);
    }
    else
    {
        CGFloat scale = (150 - offsetY) / 150;
        _imgView.transform = CGAffineTransformMakeScale(scale, scale);
        CGRect frame = _imgView.frame;
        frame.origin.y = 0;
        _imgView.frame = frame;
    }
    CGRect frame = _titleLabel.frame;
    frame.origin.y = CGRectGetMaxY(_imgView.frame) - 30;
    _titleLabel.frame = frame;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *news = _dataArray[indexPath.row];
    NSInteger type = [news.type integerValue];
    if (type == 0) {
        NewsDetailController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailController"];
        detail.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detail animated:YES];
    }
    else if (type == 1)
    {
        ImageListController *imageList = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageListController"];
        imageList.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:imageList animated:YES];
    }
    else if (type == 2)
    {
        
    }
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
