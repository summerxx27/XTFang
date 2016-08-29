//
//  HeaderView.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.headerView = [[UIImageView alloc] init];
        self.nameLabel = [[UILabel alloc] init];
        self.vipImageView = [[UIImageView alloc] init];
        
        self.headerView.backgroundColor = [UIColor yellowColor];
        self.nameLabel.backgroundColor = [UIColor cyanColor];
        self.vipImageView.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.headerView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.vipImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(25);
        make.height.width.mas_equalTo(@88);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(55);
        make.width.mas_equalTo(@88);
        make.height.mas_equalTo(@25);
    }];

    [self.vipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(10);
        make.top.equalTo(self).with.offset(55);
        make.width.height.mas_equalTo(@20);
    }];
    
//    self.headerView.image = [UIImage imageNamed:@"chenyao.jpg"];
    self.nameLabel.text = @"青柠映像";
    
}

@end
