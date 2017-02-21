//
//  Case5Cell.m
//  LFY_MasonryExercise
//
//  Created by IOS.Mac on 17/2/21.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "Case5Cell.h"
#import "Masonry.h"

@interface Case5Cell()
@property(nonatomic,strong) UIImageView *avatarView;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *contentLabel;

@property(nonatomic,weak) Case5DataEntity *dataEntity;
@end

@implementation Case5Cell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - Public methods
- (void)setupData:(Case5DataEntity *)dataEntity{
    _dataEntity = dataEntity;
    _avatarView.image = dataEntity.avatar;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

#pragma mark - Pravite methods

- (void)initView{
    _avatarView = [UIImageView new];
    [self.contentView addSubview:_avatarView];
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(4);
        make.top.equalTo(self.contentView.mas_top).offset(4);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    // Title - 单行
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(self.contentView).with.offset(4);
        make.left.equalTo(_avatarView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);

    }];
    
    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
        _contentLabel.preferredMaxLayoutWidth = 200; // 多行Label在UIScrollView内部时，多行时必须设置
    //或者UItableView使用masonry布局，没有设置Frame时需要设置 _contentLabel.preferredMaxLayoutWidth 或者在makeConstraints时使用make.width.equal(@200).priorityHign();
    [self.contentView addSubview:_contentLabel];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(_avatarView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
        make.bottom.equalTo(self.contentView).with.offset(-4);
//        make.width.equalTo(@200).priorityHigh();
    }];
    
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

@end
