//
//  CustomPopCell.m
//  CustomPopView
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 CES. All rights reserved.
//

#import "CustomPopCell.h"
#import "BaseHeader.h"
#import "Masonry.h"
@implementation CustomPopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 11, 1, 21)];
//        [self addSubview:self.iconView];
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(3 , 11, 150 , 21)];
//        self.titleLabel.font = [UIFont systemFontOfSize:14];
//        self.titleLabel.textColor = [UIColor whiteColor];
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:self.titleLabel];
//        
//        
//        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) + 5, self.bounds.size.width, 1)];
//        self.lineLabel.backgroundColor = UIColorFromRGB(0x393A3F);
//        [self addSubview:self.lineLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = CGRectMake(0, self.center.y, 1, 21);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).with.offset(SPACE);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(30);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-1);
        make.height.mas_equalTo(1);
    }];
}
- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView  = [[UIImageView alloc] init];
        [self addSubview:_iconView];
    }
    return _iconView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = UIColorFromRGB(0xe5e5e5);
        [self addSubview:_lineLabel];
    }
    return _lineLabel;
}
@end
