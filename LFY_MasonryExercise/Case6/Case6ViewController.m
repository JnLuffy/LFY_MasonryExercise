//
//  Case6ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/21.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case6ViewController.h"
#import "Masonry.h"

@interface Case6ViewController ()

@end

@implementation Case6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIScrollView使用Masonry布局";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; //如果不设置，ScrollView的子View垂直方向有可能会出现偏移问题
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor grayColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];


    
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.preferredMaxLayoutWidth = 200;//多行UILable作为ScrollView的子View时，需要设置preferredMaxLyoutWidth,因为ScrollView的子视图特殊约束问题，其实就是设置自己的宽度
    label.text = @"测试是测试是测试是测试是测试是测试是测是测试是测试是测试是测试是测试是测试是测试是是测试是测试是测试是测试是测试是测试是测试是是测试是测试是测试是测试是测试是测试是测试是是测试是测试是测试是测试是测试是测试是测试是试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是谁";
    [scrollView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        
    }];
    
    
    
    
    UIScrollView *scrollView2 = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView2];
    scrollView2.backgroundColor = [UIColor grayColor];
    [scrollView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(350);
    }];

    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor redColor];
    [scrollView2 addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView2);
        make.size.mas_equalTo(CGSizeMake(100, 500));  //子View需要确定自己的大小，ScrollView才能计算出ContentSize
        make.bottom.equalTo(scrollView2);
        make.left.right.equalTo(scrollView2).offset(20);
    }];
    
    
    // Do any additional setup after loading the view.
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
