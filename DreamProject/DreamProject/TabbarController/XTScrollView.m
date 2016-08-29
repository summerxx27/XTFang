//
//  XTScrollView.m
//  DreamProject
//
//  Created by Mac on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTScrollView.h"

@implementation XTScrollView

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        if ([pan translationInView:self].x > 0.0f && self.contentOffset.x == 0.0f) {
            return NO;
        }
    }
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

@end
