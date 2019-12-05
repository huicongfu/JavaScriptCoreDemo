//
//  FHCStackViewController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/12/5.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "FHCStackViewController.h"

@interface FHCStackViewController ()
@property (nonatomic, retain) UIStackView * containStackView;
@end

@implementation FHCStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testEasyStackView];
}

- (UIStackView *)containStackView {
    if (_containStackView == nil) {
        _containStackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, kWidth, 100)];
        _containStackView.axis = UILayoutConstraintAxisHorizontal;
        _containStackView.spacing = 10;
        _containStackView.distribution = UIStackViewDistributionFillEqually;
//        _containStackView.alignment = UIStackViewAlignmentCenter;
    }
    return _containStackView;
}

- (void)testEasyStackView {
    [self.view addSubview:self.containStackView];
}

- (void)addView {
    
    for (int i = 0; i < 3; i ++) {
        UIView *view = [[UIView alloc] init];
        int rn = arc4random()%255;
        int rn2 = arc4random()%255;
        int rn3 = arc4random()%255;
        view.backgroundColor = [UIColor colorWithRed:rn/255.0 green:rn2/255.0 blue:rn3/255.0 alpha:1];
        [self.containStackView addArrangedSubview:view];
//        if (i == 1) {
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(50);
//            }];
//        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [_containStackView layoutIfNeeded];
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addView];
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
