//
//  LaunchViewController.m
//  hkTimeMovie
//
//  Created by 看着太阳吃烧饼 on 15/11/10.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "LaunchViewController.h"

@implementation LaunchViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:self.view.bounds];
    image.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:image];
    [self loadImage];
    [self showImage];
}

-(void)loadImage
{
    _array = [[NSMutableArray alloc]initWithCapacity:5];
    CGFloat width = kScreenWidth / 4;
    CGFloat height = kScreenHeight / 6;
    for (int i = 0; i < 16; ++i) {
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        UIImage *img = [UIImage imageNamed:imageName];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        imgView.image = img;
        imgView.alpha = 0;
        [self.view addSubview:imgView];
        [_array addObject:imgView];
        int x = 0,y = 0;
        if (i <= 3) {
            x = i * width;
            y = 0;
        }
        else if(i <= 7)
        {
            x = 3 * width;
            y = (i - 3) * height;
        }
        else if(i <= 11)
        {
            x = (11 - i) * width;
            y = kScreenHeight - height;
        }
        else if(i < 16)
        {
            x = 0;
            y = (16 - i) * height;
        }
        UIImageView *imgv = _array[i];
        CGRect frame = imgv.frame;
        frame.origin = CGPointMake(x, y);
        imgv.frame = frame;

    }
}

-(void)showImage
{
    static int index = 0;
    if (index > 15) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = storyboard.instantiateInitialViewController;
        self.view.window.rootViewController = vc;
        return;
    }
    [UIView animateWithDuration:0.3 animations:^{
        UIImageView *imgv = _array[index];
        imgv.alpha = 1;
        if (index > 0) {
            UIImageView *imgv2 = _array[index - 1];
            imgv2.alpha = 0;
        }
    }];
    index ++;
    [self performSelector:@selector(showImage) withObject:nil afterDelay:0.3];
}

    
@end
