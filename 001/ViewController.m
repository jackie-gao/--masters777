//
//  ViewController.m
//  001
//
//  Created by gao zhang on 2018/5/26.
//  Copyright © 2018年 gao zhang. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic ,strong)UIButton *btntick;
@property(nonatomic ,strong)UIButton *btnstring;
@property(nonatomic ,strong)WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor orangeColor];
//   选中部分
    self.btntick = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btntick setImage:[UIImage imageNamed:@"checkbox-tick"] forState:UIControlStateNormal];
    [self.btntick setImage:[UIImage imageNamed:@"checkbox-O"] forState:UIControlStateSelected];
    [self.btntick addTarget:self action:@selector(ButtonAction1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btntick];
    self.btntick.frame=CGRectMake(50,200,64, 64);
//    协议内容
    self.btnstring = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnstring setTitle:@"隐私协议"forState: UIControlStateNormal];//    设定按钮文字
    [self.btnstring addTarget:self action:@selector(ButtonAction2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnstring];
    self.btnstring.frame=CGRectMake(120,200,100, 64);
    
}

#pragma mark 按钮事件
-(void)ButtonAction1:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        NSLog(@"选中！");
    }else{
        NSLog(@"未选！");
    }
}
-(void)ButtonAction2:(UIButton *)sender{
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https:www.baidu.com"]]];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    //开了支持滑动返回
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
