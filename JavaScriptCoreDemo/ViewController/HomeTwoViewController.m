//
//  HomeTwoViewController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/18.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "HomeTwoViewController.h"
#import "FHCStackViewController.h"
#import "FHCStackViewXibViewController.h"
#import "FHCStackViewPracticeViewController.h"

@interface HomeTwoViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic, retain) NSMutableArray * mutDataArray;

@end

@implementation HomeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testEasyStackView];
    [self createUI];
}

- (void)createUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.mutDataArray addObjectsFromArray:@[@"UIStackViewDemo",@"UIStackViewXibDemo",@"FHCStackViewPracticeViewController"]];
}

- (NSMutableArray *)mutDataArray {
    if (_mutDataArray == nil) {
        _mutDataArray = [NSMutableArray array];
    }
    return _mutDataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mutDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"CellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.mutDataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[FHCStackViewController new] animated:YES];
    } else if(indexPath.row == 1){
        [self.navigationController pushViewController:[FHCStackViewXibViewController new] animated:YES];
    }else if(indexPath.row == 2){
        [self.navigationController pushViewController:[FHCStackViewPracticeViewController new] animated:YES];
    }
    else {
       
    }
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
