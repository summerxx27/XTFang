//
//  TabViewController.m
//  DreamProject
//
//  Created by zjwang on 16/8/26.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "TabViewController.h"
#import "MainViewController.h"
#import "BestHotViewController.h"
#import "CategoryViewController.h"


@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MainViewController *newVC = [[MainViewController alloc] init];
    [self addChildViewController:newVC title:@"最新" image:@"zuixin" selectedImage:@"zuixinselected"];
    

    
    BestHotViewController *hotVC = [[BestHotViewController alloc] init];
    [self addChildViewController:hotVC title:@"最热" image:@"zuire" selectedImage:@"zuireselected"];

    
    CategoryViewController *categoryVC = [[CategoryViewController alloc] init];
    [self addChildViewController:categoryVC title:@"分类" image:@"fenlei" selectedImage:@"fenleiselected"];

    
    self.viewControllers = @[newVC, hotVC, categoryVC];

    // 改变文字的字体大小
    for (UITabBarItem *item in self.tabBar.items) {
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIFont fontWithName:@"Helvetica" size:15.0], NSFontAttributeName, nil]
                            forState:UIControlStateNormal];
        
        // 调整文字的位置
    }

}
- (void)addChildViewController:(UIViewController *)childController title: (NSString *)title image:(NSString *)image selectedImage:(NSString *)selectdImage
{
    childController.tabBarItem.title = @"";
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectdImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor colorWithRed:0.0025 green:0.0162 blue:0.0177 alpha:1.0], NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:15.0]} forState:UIControlStateNormal];
//    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor colorWithRed:0.0025 green:0.0162 blue:0.0177 alpha:1.0], NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:18.0]} forState:UIControlStateSelected];
//    [childController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -15)];

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
