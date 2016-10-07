//
//  NewsDetailController.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "NewsDetailController.h"
#import "HWDataService.h"
@interface NewsDetailController ()

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    _activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_activity stopAnimating];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithCustomView:_activity];
    self.navigationItem.rightBarButtonItem = button;
    
}

-(void)loadData
{
    NSDictionary *dic = [HWDataService DataService:@"news_detail.json"];
    _titles = dic[@"title"];
    _content = dic[@"content"];
    _time = dic[@"time"];
    _author = dic[@"author"];
    _source = dic[@"source"];
    
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSString *pathFile = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:pathFile encoding:NSUTF8StringEncoding error:nil];
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@", _source, _time];
    NSString *at = [NSString stringWithFormat:@"编辑（%@）", _author];
    
    NSString *htmlString = [NSString stringWithFormat:html, _titles, subTitle, _content, at];
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    

}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activity startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activity stopAnimating];
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
