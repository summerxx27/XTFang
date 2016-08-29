//
//  LeftMenuTableViewCell.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "LeftMenuTableViewCell.h"

@implementation LeftMenuTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.imageIcon = [[UIImageView alloc] init];
        self.showLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.imageIcon];
        [self.contentView addSubview:self.showLabel];
        
//        self.imageIcon.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.left.equalTo(self.contentView).with.offset(15);
        make.width.height.mas_offset(@44);
    }];
    
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(self.imageIcon).with.offset(5);
        make.left.equalTo(self.imageIcon.mas_right).with.offset(44);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(@35);
    }];
    
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    self.showLabel.font = [UIFont systemFontOfSize:18];
    self.showLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
