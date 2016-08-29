//
//  NewTableViewCell.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.newbestImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.newbestImageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.newbestImageView mas_makeConstraints:^(MASConstraintMaker *make) {
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
