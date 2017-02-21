//
//  Case2ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/17.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case2ViewController.h"
#import "Masonry.h"

static const CGFloat IMAGE_SIZE = 32;

@interface Case2ViewController ()
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)NSMutableArray *imageViews;
@property (strong, nonatomic) NSMutableArray *widthConstraints;
@property (strong, nonatomic) NSArray *imageNames;

@end

@implementation Case2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
      self.title = @"动态居中";
    _imageViews = [NSMutableArray new];
    _widthConstraints = [NSMutableArray new];
    _imageNames = @[@"bluefaces_1", @"bluefaces_2", @"bluefaces_3", @"bluefaces_4"];
    
    [self setUpView];
    [self controlView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
-(void)setUpView{
    
    UILabel *tipsLabel = [UILabel new];
    tipsLabel.text = @"并排两个label，整体靠左边，宽度随内容增长，左边的label“优先级更高”。";
    tipsLabel.numberOfLines = 0;
    tipsLabel.textColor = [UIColor blackColor];
    [self.view addSubview:tipsLabel];
    [tipsLabel sizeToFit];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 0, 10));
    }];
    
    
    
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        //只设置高度,宽度由子View决定
        make.height.mas_equalTo(IMAGE_SIZE);
        make.top.equalTo(tipsLabel.mas_bottom).offset(50);
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    
    //循环添加iamgeView
    for(NSUInteger i=0;i<_imageNames.count;i++){
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageNames[i]]];
        [_contentView addSubview:imageView];
        [_imageViews addObject:imageView];
    }
    
    //设定大小
    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);
    //分别设置每个imageView的宽高、左边、垂直中心约束，注意约束的对象
    //每个View的左边约束和左边的View的右边相等=。=，有点绕口...
    
    UIView __block *lastView = nil;
    MASConstraint __block *widthConstraint = nil;
    [_imageViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            //宽高固定
            widthConstraint = make.width.mas_equalTo(imageViewSize.width);
            make.height.equalTo(@(imageViewSize.height));
            //左边约束
            make.left.equalTo(lastView ? lastView.mas_right : view.superview.mas_left);
            //垂直中心对齐
            make.centerY.equalTo(view.superview.mas_centerY);
            //设置最右边的imageView的右边与父view的最有对齐
            if (idx == _imageViews.count - 1) {
                make.right.equalTo(view.superview.mas_right);
            }
            [_widthConstraints addObject:widthConstraint];
            lastView = view;
        }];
    }];
    
    
    
}

//设置四个控制UISwitch的布局
-(void)controlView{
    UIView *btnContentView = [UIView new];
    btnContentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btnContentView];
    [btnContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_bottom).offset(50);
        //只设置高度，宽度有子View来决定
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
    }];
    
    
    UIView __block *lastView = nil;
    for(NSUInteger i=0;i<4; i++){
        UISwitch *mySwitch = [UISwitch new];
        [mySwitch setOn:YES];
        mySwitch.tag = i;
        [mySwitch addTarget:self action:@selector(switchAtion:) forControlEvents:UIControlEventValueChanged];
        [btnContentView addSubview:mySwitch];

        [mySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(i==0 ? btnContentView.mas_left : lastView.mas_right).offset(10);
            
            make.centerY.equalTo(btnContentView);
            if(i ==3){
                make.right.equalTo(mySwitch.superview.mas_right).offset(-10);
            }
        }];
        lastView = mySwitch;
    }
    
}


#pragma mark - Action 
-(void)switchAtion:(UISwitch *)sender{
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *width = _widthConstraints[index];
    
    if (sender.on) {
        width.equalTo(@(IMAGE_SIZE));
    } else {
        width.equalTo(@0);
    }
}

@end
