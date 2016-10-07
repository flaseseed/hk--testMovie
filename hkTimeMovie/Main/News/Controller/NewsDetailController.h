//
//  NewsDetailController.h
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "BasicViewController.h"

@interface NewsDetailController : BasicViewController<UIWebViewDelegate>
@property (nonatomic,copy) NSString *titles;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UIActivityIndicatorView *activity;

@end
