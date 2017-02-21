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
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:scrollView];
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.view).offset(100);
//    }];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = self.view.bounds.size;
    
//    scrollView.contentSize = CGSizeMake(100, 100);
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.preferredMaxLayoutWidth = 200;
    label.text = @"测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是测试是谁";
    [scrollView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
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
