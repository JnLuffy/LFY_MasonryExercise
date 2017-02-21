//
//  ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/17.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"有趣的AutoLayout示例-Maonry实现";
    self.dataArray = @[@"并排Label",@"动态居中",@"百分比宽度",@"变高UITableViewCell",@"FTDTemplateLayout变高",@"top(bottom)GuideView",@"自定义baseline",@"Parallax Header",@"动态展开UITableViewCell",@"两种方式实现等间距",@"用优先级保证内容可见",@"AutoLayout的“捆绑”特性",@"分阶段生效约束",@"Cell中并排多个变高的Label"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *indentifier = @"cell";     //  0
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Case %ld",indexPath.row+1];
    cell.detailTextLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *classString = [NSString stringWithFormat:@"Case%ldViewController",indexPath.row+1];
    Class someClass = NSClassFromString(classString);
    if (someClass){
        UIViewController *viewController = [[someClass alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }

}


@end
