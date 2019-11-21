//
//  FHCTabBarController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/18.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "FHCTabBarController.h"
#import "FHCNavigationController.h"
#import "HomeOneViewController.h"
#import "HomeTwoViewController.h"
#import "HomeThreeViewController.h"
#import "HomeFourViewController.h"

@interface FHCTabBarController ()

@end

@implementation FHCTabBarController

- (instancetype)init {
    if (self = [super init]) {
        HomeOneViewController * vc1 = [[HomeOneViewController alloc] init];
        vc1.title = @"One";
        FHCNavigationController * nav1 = [[FHCNavigationController alloc] initWithRootViewController:vc1];
        
        HomeTwoViewController * vc2 = [[HomeTwoViewController alloc] init];
        vc2.title = @"Two";
        FHCNavigationController * nav2 = [[FHCNavigationController alloc] initWithRootViewController:vc2];
        
        HomeThreeViewController * vc3 = [[HomeThreeViewController alloc] init];
        vc3.title = @"Three";
        FHCNavigationController * nav3 = [[FHCNavigationController alloc] initWithRootViewController:vc3];
        
        HomeFourViewController * vc4 = [[HomeFourViewController alloc] init];
        vc4.title = @"Four";
        FHCNavigationController * nav4 = [[FHCNavigationController alloc] initWithRootViewController:vc4];
        
        self.viewControllers = @[nav1, nav2, nav3, nav4];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI {
    
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
