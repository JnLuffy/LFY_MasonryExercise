//
//  Case1ViewController.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/17.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case1ViewController.h"
#import "Masonry.h"

@interface Case1ViewController ()
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UIView *contentView;
@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"并排Label";
    [self setUpView];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -setupView
-(void)setUpView{
    UILabel *tipsLabel = [UILabel new];
    tipsLabel.text = @"并排两个label，整体靠左边，宽度随内容增长，左边的label“优先级更高”。";
    tipsLabel.numberOfLines = 0;
    tipsLabel.textColor = [UIColor blackColor];
    [self.view addSubview:tipsLabel];
    [tipsLabel sizeToFit];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 0, 10));
    }];
    
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 0, 10));
        make.top.equalTo(tipsLabel.mas_bottom).offset(20);
        make.height.equalTo(@50);
    }];
    
    
    _label1 = [UILabel new];
    _label1.backgroundColor = [UIColor yellowColor];
    _label1.text = @"label,";
    
    _label2 = [UILabel new];
    _label2.backgroundColor = [UIColor greenColor];
    _label2.text = @"label,";
    
    [_contentView addSubview:_label1];
    [_contentView addSubview:_label2];
    
    // label1
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_top).with.offset(5);
        make.left.equalTo(_contentView.mas_left).with.offset(2);
        make.bottom.equalTo(_contentView.mas_bottom).with.offset(-5);
    }];
    
    // label2: 位于右上角
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边贴着label1
        make.left.equalTo(_label1.mas_right).with.offset(2);
        
        //上边贴着父view
        make.top.equalTo(_contentView.mas_top).with.offset(5);
        
        //右边的间隔保持大于等于2，注意是lessThanOrEqual
        //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
        //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
        make.right.lessThanOrEqualTo(_contentView.mas_right).with.offset(-2);
        make.bottom.equalTo(_contentView.mas_bottom).with.offset(-5);

    }];
    
    //设置label1的content hugging 为1000
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
    //设置label2的content hugging 为100
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label2的content compression 为250
    //设置右边的label2的content compression 为250
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];

    UIStepper *setpper1 = [[UIStepper alloc]init];
    setpper1.tag = 1;
    [self.view addSubview:setpper1];
    setpper1.minimumValue = 0;
    setpper1.maximumValue = 50;
    setpper1.stepValue = 1;
    [setpper1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(10);
    }];
    
    
    UIStepper *setpper2 = [[UIStepper alloc]init];
    setpper2.tag = 2;
    [self.view addSubview:setpper2];
    setpper2.minimumValue = 0;
    setpper2.maximumValue = 50;
    setpper2.stepValue = 1;
    [setpper2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_bottom).offset(50);
        make.right.equalTo(self.view).offset(-10);
    }];
    
    [setpper1 addTarget:self action:@selector(setpperAction:) forControlEvents:UIControlEventValueChanged];
    [setpper2 addTarget:self action:@selector(setpperAction:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - Action
-(void)setpperAction:(UIStepper *)sender{
    switch (sender.tag) {
        case 1://label1 大小控制
        {
            _label1.text = [self getLabelContentWithCount:(NSUInteger)sender.value];

        }
            break;
        case 2://label2 大小控制
        {
            _label2.text = [self getLabelContentWithCount:(NSUInteger)sender.value];

        }
            break;
        default:
            break;
    }
}


#pragma mark - Private Method
-(NSString *)getLabelContentWithCount:(NSUInteger)count{
    NSMutableString *ret = [NSMutableString new];
    
    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }
    
    return ret.copy;
}

@end
