//
//  HomeViewController.m
//  DreamProject
//
//  Created by zjwang on 16/8/29.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+SLExtension.h"

#import "MainViewController.h"
#import "BestHotViewController.h"
#import "CategoryViewController.h"
#import "ALinSelectedView.h"
@interface HomeViewController ()<UIScrollViewDelegate>
@property(nonatomic, assign) ALinSelectedView *selectedView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) MainViewController *mianVC;
@property (nonatomic, strong) BestHotViewController *hotVC;
@property (nonatomic, strong) CategoryViewController *cateVC;
@end

@implementation HomeViewController

#pragma mark - 设置底部选择视图
- (void)setUpBottomMenu
{
    // 设置顶部选择视图
    ALinSelectedView *selectedView = [[ALinSelectedView alloc] initWithFrame:CGRectMake(0, SRN_HEIGHT - 45, SRN_WIDTH, 45)];
    [selectedView setSelectedBlock:^(HomeType type) {
        [self.scrollView setContentOffset:CGPointMake(type * ALinScreenWidth, 0) animated:YES];
    }];
    [self.view addSubview:selectedView];
    _selectedView = selectedView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page = scrollView.contentOffset.x / ALinScreenWidth;
    CGFloat offsetX = scrollView.contentOffset.x / ALinScreenWidth * (self.selectedView.width * 0.5 - Home_Seleted_Item_W * 0.5 - 15);
    self.selectedView.underLine.x = 15 + offsetX;
    if (page == 1 ) {
        self.selectedView.underLine.x = offsetX;
    }else if (page > 1){
        self.selectedView.underLine.x = offsetX;
    }
    self.selectedView.selectedType = (int)(page + 0.5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SRN_WIDTH, SRN_HEIGHT - HEIGHT)];
    view.contentSize = CGSizeMake(SRN_WIDTH * 3, 0);
    // 去掉滚动条
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    // 设置分页
    view.pagingEnabled = YES;
    // 设置代理
    view.delegate = self;
    // 去掉弹簧效果
    view.bounces = NO;
    
    CGFloat height = SRN_HEIGHT - 49;
    
    // 添加子视图
    MainViewController *main = [[MainViewController alloc] init];
    main.view.frame = CGRectMake(0, 0, SRN_WIDTH, SRN_HEIGHT - HEIGHT);
    main.view.height = height;
    [self addChildViewController:main];
    [view addSubview:main.view];
    _mianVC = main;
    
    
    BestHotViewController *hot = [[BestHotViewController alloc] init];
    hot.view.frame = CGRectMake(0, 0, SRN_WIDTH, SRN_HEIGHT - HEIGHT);
    hot.view.x = SRN_WIDTH;
    hot.view.height = height;
    [self addChildViewController:hot];
    [view addSubview:hot.view];
    _hotVC = hot;
    
    CategoryViewController *cate = [[CategoryViewController alloc] init];
    cate.view.frame = CGRectMake(0, 0, SRN_WIDTH, SRN_HEIGHT - HEIGHT);
    cate.view.x = SRN_WIDTH * 2;
    cate.view.height = height;
    [self addChildViewController:cate];
    [view addSubview:cate.view];
    _cateVC = cate;
    
    [self.view addSubview:view];
    self.scrollView = view;
    [self setUpBottomMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
