//
//  TopDetailViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/6.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopDetailCell.h"
#import "HWDataService.h"
#import "UIImageView+WebCache.h"
@interface TopDetailViewController ()


@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self requestData];
}

-(void)requestData
{
    NSDictionary *detail = [HWDataService DataService:@"movie_detail.json"];
    NSDictionary *comment = [HWDataService DataService:@"movie_comment.json"];
    _commentData = [[NSMutableArray alloc]initWithCapacity:5];
    NSArray *commentArray = comment[@"list"];
    for (NSDictionary *dic in commentArray) {
        _topDetail = [[TopDetail alloc]init];
        _topDetail.userImage = dic[@"userImage"];
        _topDetail.nickname = dic[@"nickname"];
        _topDetail.rating = dic[@"rating"];
        _topDetail.content = dic[@"content"];
        
        [_commentData addObject:_topDetail];
    }
    
    _topDetail.images = detail[@"images"];
    _topDetail.TopImage = detail[@"image"];
    _topDetail.titleCn = detail[@"titleCn"];
    _topDetail.titleEn = detail[@"titleEn"];
    _topDetail.content = detail[@"content"];
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell" forIndexPath:indexPath];
        UIImageView *titleImage = [tableView viewWithTag:200];
        [titleImage sd_setImageWithURL:[NSURL URLWithString:_topDetail.TopImage]];
        UILabel *titleCn = [tableView viewWithTag:201];
        titleCn.text = _topDetail.titleCn;
        UILabel *titleEn = [tableView viewWithTag:202];
        titleEn.text = _topDetail.titleEn;
        UITextView *textView = [tableView viewWithTag:203];
        textView.text = _topDetail.content;
        return cell;
    }
    else if(indexPath.row == 1)
    {
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        UIImageView *image1 = [tableView viewWithTag:100];
        [image1 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[0]]];
        UIImageView *image2 = [tableView viewWithTag:101];
        [image2 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[1]]];
        UIImageView *image3 = [tableView viewWithTag:102];
        [image3 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[2]]];
        UIImageView *image4 = [tableView viewWithTag:103];
        [image4 sd_setImageWithURL:[NSURL URLWithString:_topDetail.images[3]]];

        return cell;
    }
    else
    {
        TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentaryCell" forIndexPath:indexPath];
        cell.topDetail = _commentData[indexPath.row - 2];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    else if (indexPath.row == 1)
    {
        return 85;
    }
    else if (indexPath == _index)
    {
        TopDetail *top = self.commentData[indexPath.row - 2];
        NSString *text = top.content;
        CGRect size = [text boundingRectWithSize:CGSizeMake(250,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil];
        return size.size.height + 60;
    }
    else return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _index = indexPath;
    NSArray *indexpath = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:indexpath withRowAnimation:UITableViewRowAnimationFade];
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
