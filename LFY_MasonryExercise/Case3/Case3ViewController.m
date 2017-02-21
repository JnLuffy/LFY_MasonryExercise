//
//  Case3ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/17.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case3ViewController.h"
#import "Masonry.h"

@interface Case3ViewController ()
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)MASConstraint *widthConstraint;
@end

@implementation Case3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"百分比宽度";

    
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
    tipsLabel.text = @"子View的宽度始终是父View宽度的一半";
    tipsLabel.numberOfLines = 0;
    tipsLabel.textColor = [UIColor blackColor];
    [self.view addSubview:tipsLabel];
    [tipsLabel sizeToFit];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 0, 10));
    }];
    
    //灰色父View
    self.contentView = [UIView new];
    _contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        _widthConstraint =  make.width.equalTo(@(self.view.frame.size.width-20));
        make.top.equalTo(tipsLabel.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(10);
        make.height.equalTo(@80);
    }];
 
    
    //红色子View
    UIView *childView = [UIView new];
    childView.backgroundColor = [UIColor redColor];
    [_contentView addSubview:childView];
    [childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(_contentView);
        make.width.equalTo(_contentView.mas_width).multipliedBy(0.5);
    }];
    
    
    
}

-(void)controlView{
    UISlider *slider = [UISlider new];
    slider.value = 1.0f;
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@50);
    }];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Action
-(void)sliderAction:(UISlider *)sender{
    if(sender.value){
        NSLog(@"sender.value = %f",sender.value * self.view.frame.size.width * 0.9);
        _widthConstraint.mas_equalTo(sender.value *(self.view.frame.size.width-20));
    }

}

@end
