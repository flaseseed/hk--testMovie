//
//  MainTabBarController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "MainTabBarController.h"
#import "HWTabBarItem.h"
@interface MainTabBarController ()
@property (nonatomic,strong) UIImageView *select;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    //设置导航栏的背景
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    //设置导航控制器的barstyle
//    [[UINavigationBar appearance]setBarStyle:UIBarStyleBlack];
}

//不能在viewDidLoad里调用删除tabbarbutton，因为视图加载后还会再调用一次tabbar
//需要在视图显示后再删除自带的tabbarbutton
-(void)viewWillAppear:(BOOL)animated
{
    //先调用父视图，否则删不掉
    [super viewWillAppear:animated];
    [self _createTabbar];
}

//删除系统自带的tabbarbutton
-(void)_createTabbar
{
    for (UIView *view in self.tabBar.subviews) {
        //判断类型，如果符合，则删除。
        //Class是一个抽象类，可以将相同的类归纳为一个类
        //例：视图1，视图2 ----> 视图类
        //   视图类，按钮类，图片类 ----> 类
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    
    NSArray *imgArray = @[@"movie_home.png",@"msg_new.png",@"start_top250.png",@"icon_cinema.png",@"more_setting.png"];
    NSArray *titleArray = @[@"电影",@"新闻",@"top",@"影院",@"更多"];
    
    //按钮的宽高
    CGFloat width = self.tabBar.bounds.size.width / imgArray.count;
    CGFloat height = CGRectGetHeight(self.tabBar.bounds);
    
    //循环创建button
    for(int i = 0; i < imgArray.count; ++i)
    {        
        CGRect frame = CGRectMake(i * width, 0, width, height);
        //子类化button
        HWTabBarItem *button = [[HWTabBarItem alloc]initWithFrame:frame imageName:imgArray[i] title:titleArray[i]];
        
        button.tag = i;
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        
        //初始按钮遮盖视图的位置
        if (i == 0 && _select == nil) {
            //按钮遮盖视图
            _select = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 55)];
            _select.image = [UIImage imageNamed:@"selectTabbar_bg_all1.png"];
            [self.tabBar insertSubview:_select belowSubview:button];
            _select.center = button.center;
        }
    }
}

//标签栏按钮的点击事件
-(void)click:(HWTabBarItem *)button
{
    //切换标签页
    self.selectedIndex = button.tag;
    [UIView animateWithDuration:0.3 animations:^{
        //移动按钮遮盖视图
        _select.center = button.center;
    }];
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
