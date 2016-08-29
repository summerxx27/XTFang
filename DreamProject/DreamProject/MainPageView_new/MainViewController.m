//
//  MainViewController.m
//  DreamProject
//
//  Created by zjwang on 16/8/26.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "MainViewController.h"
#import "NewTableViewCell.h"

#define CellID @"cellID"
@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@end

@implementation MainViewController
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SRN_WIDTH, SRN_HEIGHT - HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 198;
        [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:CellID];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"最新";
    self.arrayData = @[@"chenyao.jpg"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.newbestImageView.image = [UIImage imageNamed:@"chenyao.jpg"];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
