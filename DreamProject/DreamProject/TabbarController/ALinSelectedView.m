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
- (UIButton *)newbtn
{
    if (!_newbtn) {
        _newbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _newbtn;
}
- (UIButton *)hotbtn
{
    if (!_hotbtn) {
        _hotbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _hotbtn;
}
- (UIButton *)catebtn
{
    if (!_catebtn) {
        _catebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _catebtn;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.newbtn];
        [self addSubview:self.hotbtn];
        [self addSubview:self.catebtn];
        [self setup];
    }
    return self;
}

- (void)setup
{
    _newbtn.frame = CGRectMake(0 + SRN_WIDTH / 3 * 0, 0, SRN_WIDTH / 3, 40);
    _newbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [_newbtn setTitle:@"最新" forState:UIControlStateNormal];
    [_newbtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
    [_newbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _newbtn.tag = 100;
    [_newbtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _hotbtn.frame = CGRectMake(0 + SRN_WIDTH / 3 * 1, 0, SRN_WIDTH / 3, 40);
    _hotbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_hotbtn setTitle:@"最热" forState:UIControlStateNormal];
    [_hotbtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
    [_hotbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _hotbtn.tag = 101;
    [_hotbtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    _catebtn.frame = CGRectMake(0 + SRN_WIDTH / 3 * 2, 0, SRN_WIDTH / 3, 40);
    _catebtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_catebtn setTitle:@"分类" forState:UIControlStateNormal];
    [_catebtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
    [_catebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    _catebtn.tag = 102;
    [_catebtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self click:_newbtn];
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
