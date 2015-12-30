//
//  ViewController.m
//  AutoScrollView
//
//  Created by zhumingke on 15/10/29.
//  Copyright (c) 2015年 朱明科. All rights reserved.
//

#import "ViewController.h"
#import "AutoScroll.h"

@interface ViewController ()
@property(nonatomic)NSMutableArray *imgArr;
@property(nonatomic)AutoScroll *scrollView;
@property(nonatomic)NSArray *tapUrl;//可以返回一个连接，再做处理
@property(nonatomic)NSArray *titleArr;//根据需求接受网络下载数据，这里是本地测试
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgArr = [NSMutableArray array];
    self.tapUrl = [NSArray array];
    [self initData];
    [self createScroll];
}
-(void)initData{
    self.titleArr = @[@"霾都北京",@"雾都上海",@"雨都杭州",@"人间地狱花生炖"];
    self.tapUrl = @[@"北京",@"上海",@"杭州",@"花生炖"];
    for (int i=0; i<4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        [self.imgArr addObject:image];
    }
}
-(void)createScroll{
    self.scrollView = [[AutoScroll alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200) imageArray:self.imgArr titleArray:self.titleArr];
    _scrollView.picUrl = self.tapUrl;
    _scrollView.viewController = self;
    [self.view addSubview:_scrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
