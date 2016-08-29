//
//  CateCollectionViewCell.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "CateCollectionViewCell.h"

@implementation CateCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageColl = [UIImageView new];
        [self.contentView addSubview:self.imageColl];
    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super layoutSubviews];

    self.imageColl.backgroundColor = [UIColor yellowColor];
    
    [self.imageColl mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.bottom.left.right.equalTo(self.contentView).with.offset(0);
    }];
}
@end
