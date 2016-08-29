//
//  LeftMenuViewController.m
//  DreamProject
//
//  Created by zjwang on 16/8/26.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenuTableViewCell.h"
#import "MainViewController.h"
#import "HeaderView.h"
#import <MMDrawerController.h>
#import <UIViewController+MMDrawerController.h>
#define CellID @"cellID"
@interface LeftMenuViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation LeftMenuViewController
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SRN_WIDTH * 0.8, SRN_HEIGHT - 66) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 66;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[LeftMenuTableViewCell class] forCellReuseIdentifier:CellID];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // init array
    self.listArray = @[@"账号设置", @"我的钱包", @"我的收藏", @"会员中心", @"已购项目", @"离线缓存", @"设置中心"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chenyao.jpg"]];
    [self.view addSubview:self.tableView];
    // HeaderView
    HeaderView *tbHeader = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SRN_WIDTH, 188)];
    _tableView.tableHeaderView = tbHeader;
    // 不允许滑动
    _tableView.bounces = NO;
    _tableView.separatorColor = [UIColor clearColor];
    
    // 关闭按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.mas_equalTo(SRN_HEIGHT - 20 - 44);
        make.left.mas_equalTo(SRN_WIDTH * 0.8 - 20 - 44);
        make.width.height.equalTo(@44);
    }];
    [btn addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
}
#pragma mark -
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.showLabel.text = _listArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)closeClick:(UIButton *)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
