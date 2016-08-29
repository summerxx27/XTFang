//
//  ALinSelectedView.m
//  MiaowShow
//
//  Created by ALin on 16/6/14.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import "ALinSelectedView.h"

@interface ALinSelectedView()
@property (nonatomic, weak)UIView *underLine;
@property (nonatomic, strong)UIButton *selectedBtn;
@property (nonatomic, weak)UIButton *hotBtn;
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
        newBtn.frame = CGRectMake(0 + (SRN_WIDTH - 40) * i, 0, SRN_WIDTH / 3, 40);
        newBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [newBtn setTitle:titles[i] forState:UIControlStateNormal];
        [newBtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
        [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        newBtn.tag = HomeTypeNew;
        [newBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self click:newBtn];
        }
        NSLog(@"i ======= %d", i);
        [self addSubview:newBtn];
    }
    
    // 强制更新一次
    [self layoutIfNeeded];
    // 默认选中最新
}




- (void)setSelectedType:(HomeType)selectedType
{
    _selectedType = selectedType;
    self.selectedBtn.selected = NO;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag == selectedType) {
            self.selectedBtn = (UIButton *)view;
            ((UIButton *)view).selected = YES;
        }
    }
    
}

// 点击事件
- (void)click:(UIButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    NSLog(@"btnX =========== %lf", btn.x);
    [UIView animateWithDuration:0.5 animations:^{
        self.underLine.x = btn.x + 10;
    }];
    NSLog(@"btnX2 =========== %lf", btn.x);

    if (self.selectedBlock) {
        self.selectedBlock(btn.tag);
    }
}
@end
