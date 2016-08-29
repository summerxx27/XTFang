//
//  HotTableViewCell.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "HotTableViewCell.h"

@implementation HotTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.hotImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.hotImageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.hotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.bottom.left.right.equalTo(self.contentView).with.offset(0);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
