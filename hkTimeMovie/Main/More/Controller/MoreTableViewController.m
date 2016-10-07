//
//  MoreTableViewController.m
//  hkTimeMovie
//
//  Created by 看着太阳吃烧饼 on 15/11/10.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "MoreTableViewController.h"
#import "UIImageView+WebCache.h"
@implementation MoreTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self countCatchSize];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self countCatchSize];
}
-(void)countCatchSize
{
    NSUInteger fileSize = [[SDImageCache sharedImageCache]getSize];
    _CatchLable.text = [NSString stringWithFormat:@"%.1fM",fileSize / 1024.0 / 1024.0];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"清理缓存" message:@"是否清理缓存？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alert.delegate = self;
        [alert show];
        [tableView cellForRowAtIndexPath:indexPath].selected = NO;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        [self countCatchSize];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
