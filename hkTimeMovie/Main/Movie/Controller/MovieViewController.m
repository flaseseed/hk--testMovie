//
//  MovieViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"
#import "HWDataService.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏右边按钮
    [self _loadNavigationItem];
    //创建table
    [self _loadTableView];
    //创建posterview
    [self _loadPosterView];
    //解析数据
    [self _requestData];
    
    _tab.rowHeight = 120;
}


//解析json数据
-(void)_requestData
{
    NSDictionary *dic = [HWDataService DataService:@"us_box.json"];
    NSArray *subjects = [dic objectForKey:@"subjects"];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (NSDictionary *dataDic in subjects) {
        NSDictionary *detailDic = [dataDic objectForKey:@"subject"];
        Movie *movie = [[Movie alloc]init];
        movie.average = [[detailDic objectForKey:@"rating"] objectForKey:@"average"];
        movie.title = detailDic[@"title"];
        movie.subtype = detailDic[@"subtype"];
        movie.year = detailDic[@"year"];
        movie.images = detailDic[@"images"];
        movie.movieID = detailDic[@"id"];
        movie.collect_count = detailDic[@"collect_count"];
        movie.original_title = detailDic[@"original_title"];
        
        [_dataArray addObject:movie];
    }
    [_tab reloadData];
    [_posterView setDataArray:_dataArray];
}

//创建posterview
-(void)_loadPosterView
{
    _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)];
    _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self.view insertSubview:_posterView atIndex:0];
}

//创建table
-(void)_loadTableView
{
    _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) style:UITableViewStylePlain];
    //把图片转成颜色
    [_tab setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]]];
    _tab.separatorColor = [UIColor darkGrayColor];
    _tab.delegate = self;
    _tab.dataSource = self;
    _tab.hidden = YES;
    [self.view addSubview:_tab];
}

//创建导航栏右边按钮
-(void)_loadNavigationItem
{
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = buttonView.frame;
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    button1.tag = 100;
    [buttonView addSubview:button1];
    [button1 addTarget:self action:@selector(navigationBarRightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = buttonView.frame;
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    button2.tag = 101;
    [buttonView addSubview:button2];
    [button2 addTarget:self action:@selector(navigationBarRightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加到导航栏右边按钮
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

//导航栏右边按钮点击事件
-(void)navigationBarRightButtonAction:(UIButton *)button
{
    //取出按钮的父视图
    UIView *buttonView = button.superview;
    
    [self flipView:buttonView left:(button.tag == 100)];
    
    //视图不隐藏的话会被覆盖
    _posterView.hidden = !_posterView.hidden;
    _tab.hidden = !_tab.hidden;
    
    [self flipView:self.view left:(button.tag == 100)];
}

//翻转
-(void)flipView:(UIView *)subview left:(BOOL)flag
{
    //三目运算符根据tag判断翻转方向（还可以用button.hidden判断）
    UIViewAnimationOptions flip = flag ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    //翻转动画
    [UIView transitionWithView:subview duration:0.5 options:flip animations:^{
        [subview exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:nil];

}

#pragma mark - tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MovieTableViewCell" owner:self options:nil]lastObject];
    }
    cell.movie = _dataArray[indexPath.row];
    return cell;
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
