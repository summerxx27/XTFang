//
//  ALinSelectedView.h
//  MiaowShow
//
//  Created by ALin on 16/6/14.
//  Copyright © 2016年 ALin. All rights reserved.
//  首页导航的顶部选择视图

#import <UIKit/UIKit.h>

typedef void(^selectedBlock)(NSInteger tag, UIButton *btn);

typedef NS_ENUM(NSUInteger, HomeType) {
    HomeTypeNew, // 最新
    HomeTypeHot, // 热门
    HomeTypeCare // 分类
};

@interface ALinSelectedView : UIView
/** 选中了 */
@property(nonatomic, copy) selectedBlock block;
/** 下划线 */
@property (nonatomic, weak, readonly) UIView *underLine;

@end
