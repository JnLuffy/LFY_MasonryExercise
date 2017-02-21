//
//  Case5ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/21.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case5ViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Case5DataEntity.h"
#import "Common.h"
#import "Masonry.h"
#import "Case5Cell.h"


@interface Case5ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation Case5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self generateData];
    
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];  //记录下来，masonry 初始化UITableView的问题，是不是和UIScrollView的AutoLayout设置有关系吗？ 需要验证一下
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view);
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//    }];
    [self.tableView registerClass:[Case5Cell class] forCellReuseIdentifier:@"Case5Cell"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Case5Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Case5Cell"];

    [cell setupData:_dataArray[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableView fd_heightForCellWithIdentifier:@"Case5Cell" cacheByIndexPath:indexPath configuration:^(Case5Cell *cell) {
        
        // 在这个block中，重新cell配置数据源
        [cell setupData:_dataArray[indexPath.row]];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}


#pragma mark - Private methods
- (void)generateData {
    NSMutableArray *tmpData = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 20; i++) {
        Case5DataEntity *dataEntity = [Case5DataEntity new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d",(i % 4) +1 ]];
        dataEntity.title = [NSString stringWithFormat:@"Title %d",i];
        dataEntity.content = [Common getText:@"content-" withRepeat:2 * i + 1];
        [tmpData addObject:dataEntity];
    }
    
    _dataArray = tmpData;
}
@end
