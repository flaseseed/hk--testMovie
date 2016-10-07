//
//  CinemaViewController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaTableViewCell.h"
#import "HWDataService.h"
@interface CinemaViewController ()
@property (nonatomic,assign) NSInteger tag;

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解析数据
    [self requestData];
    //创建tableView
    [self creatTableView];
}

-(void)creatTableView
{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.rowHeight = 83;
    [self.view addSubview:_table];
    _tag = -1;
    
}

//解析数据
-(void)requestData
{
    NSDictionary *cinema_list = [HWDataService DataService:@"cinema_list.json"];
    NSDictionary *district_list = [HWDataService DataService:@"district_list.json"];
    
    NSArray *cinemaArray = cinema_list[@"cinemaList"];
    NSArray *districtArray = district_list[@"districtList"];
    
    _cinema_dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    _district_dataArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    for (NSDictionary *cinemaDic in cinemaArray) {
        _cinema = [[Cinema alloc]initContentWithDic:cinemaDic];        
        [_cinema_dataArray addObject:_cinema];
    }
    for (NSDictionary *districtDic in districtArray) {
        _district = [[District alloc]init];
        _district.distric_list_Id = districtDic[@"id"];
        _district.distric_list_name = districtDic[@"name"];
        [_district_dataArray addObject:_district];
    }
    [_table reloadData];
}

//归整数据
/*
  dic{@“每组个数”：@“每组个数”;
      @“数组”   ：@“数组” }
*/

-(void)countSection:(NSInteger)i
{
        _dic = [[NSMutableDictionary alloc]init];
        _array = [[NSMutableArray alloc]initWithCapacity:5];
        _district = _district_dataArray[i];
        for (int j = 0; j < _cinema_dataArray.count; ++j) {
            _cinema = _cinema_dataArray[j];
            if ([_cinema.districtId isEqualToString:_district.distric_list_Id]) {
                [_array addObject:_cinema_dataArray[j]];
            }
        }
        NSString *count = [NSString stringWithFormat:@"%ld",_array.count];
        [_dic setObject:_array forKey:@"array"];
        [_dic setObject:count forKey:@"count"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self countSection:section];
    if(_tag == section)
    {
        return [_dic[@"count"] integerValue];
    }
    else
    {
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSInteger co = 0;
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"Cinehk-seedell" owner:nil options:nil]lastObject];
    }
    co++;
    NSInteger index = indexPath.row;
    [self countSection:indexPath.section];
    if (index > [_dic[@"count"] integerValue]) {
        index -= co;
    }
    cell.cinema = _dic[@"array"][index];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _district_dataArray.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kScreenWidth, 40);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 100, 30)];
    [self countSection:section];
    _district = _district_dataArray[section];
    label.text = _district.distric_list_name;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:17];
    [headerView addSubview:label];
    [headerView addSubview:button];
    button.tag = section;
    button.selected = NO;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return headerView;
}

-(void)buttonAction:(UIButton *)button
{
    [self countSection:button.tag];
    if (_tag == button.tag) {
        _tag = -1;
    }
    else
    {
        if (_tag != -1) {
            [self buttonAction:(UIButton *)[_table viewWithTag:_tag]];
        }
        _tag = button.tag;
    }
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:button.tag];
    [_table reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
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
