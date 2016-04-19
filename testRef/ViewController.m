//
//  ViewController.m
//  testRef
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

@interface ViewController () <UIScrollViewDelegate>


@property (nonatomic,assign)BOOL  isLogind;

@property (nonatomic,strong)UIScrollView * scrollView;


@property (nonatomic,strong)UIImageView * imageView;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight+.4);
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    __block ViewController * mySelf = self;
    [self.scrollView addHeaderWithCallback:^{
        [NSTimer scheduledTimerWithTimeInterval:1 target:mySelf selector:@selector(closeRef) userInfo:nil repeats:NO];
    }];
    
    [self.scrollView addFooterWithCallback:^{
        [NSTimer scheduledTimerWithTimeInterval:1 target:mySelf selector:@selector(closeRef) userInfo:nil repeats:NO];

    }];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"4.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [scrollView addSubview:imageView];
    
}
- (void)closeRef
{
    [self.scrollView headerEndRefreshing];
    [self.scrollView footerEndRefreshing];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
