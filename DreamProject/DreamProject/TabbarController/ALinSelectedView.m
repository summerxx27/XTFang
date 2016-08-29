//
//  ALinSelectedView.m
//  MiaowShow
//
//  Created by ALin on 16/6/14.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import "ALinSelectedView.h"

@interface ALinSelectedView()
@property (nonatomic, weak) UIView *underLine;
@end

@implementation ALinSelectedView

- (UIView *)underLine
{
    if (!_underLine) {
        UIView *underLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 4, SRN_WIDTH / 3, 2)];
        underLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:underLine];
        _underLine = underLine;
    }
    return _underLine;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    NSArray *titles = @[@"最新", @"最热", @"分类"];
    
    for (int i = 0; i < 3; i ++) {
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        newBtn.frame = CGRectMake(0 + SRN_WIDTH / 3 * i, 0, SRN_WIDTH / 3, 40);
        newBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [newBtn setTitle:titles[i] forState:UIControlStateNormal];
        [newBtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
        [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        newBtn.tag = i + 100;
        [newBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 100) {
            [self click:newBtn];
        }
        [self addSubview:newBtn];
    }
}
#pragma mark - 点击事件
- (void)click:(UIButton *)btn
{
 
    [UIView animateWithDuration:0.25 animations:^{
        self.underLine.x = btn.x;
    }];
    if (self.block != nil) {
        self.block(btn.tag, btn);
    }
}
@end
