//
//  Copyright © 2016年 ALin. All rights reserved.

#import <UIKit/UIKit.h>

typedef void(^selectedBlock)(NSInteger tag, UIButton *btn);

typedef NS_ENUM(NSUInteger, HomeType) {
    HomeTypeNew, // 最新
    HomeTypeHot, // 热门
    HomeTypeCare // 分类
};

@interface ALinSelectedView : UIView

@property(nonatomic, copy) selectedBlock block;

@property (nonatomic, weak, readonly) UIView *underLine;

@property (nonatomic, strong) UIButton *newbtn;
@property (nonatomic, strong) UIButton *hotbtn;
@property (nonatomic, strong) UIButton *catebtn;
@end
