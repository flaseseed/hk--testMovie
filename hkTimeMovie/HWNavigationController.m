//
//  HWNavigationController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/10/31.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "HWNavigationController.h"

@interface HWNavigationController ()

@end

@implementation HWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //改变导航栏字体颜色
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationBar.titleTextAttributes = textAttributes;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
}

//返回子控制器的状态栏style
-(UIStatusBarStyle)preferredStatusBarStyle
{
    UIStatusBarStyle style = [self.topViewController preferredStatusBarStyle];
    return style;
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
