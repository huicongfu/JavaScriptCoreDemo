//
//  FHCStackViewPracticeViewController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/12/6.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "FHCStackViewPracticeViewController.h"

@interface FHCStackViewPracticeViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackOneView;
@property (weak, nonatomic) IBOutlet UIStackView *stackTwoView;

@end

@implementation FHCStackViewPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addLimitAction:(UIButton *)sender {
    UIImageView * imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"limit"]];
    [self.stackTwoView addArrangedSubview:imgView];
    [UIView animateWithDuration:0.25 animations:^{
        [self.stackTwoView layoutIfNeeded];
    }];
}
- (IBAction)removeLimitAction:(UIButton *)sender {
    UIImageView *starImageView = self.stackTwoView.arrangedSubviews.lastObject;
    [self.stackTwoView removeArrangedSubview:starImageView];
    [starImageView removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        [self.stackTwoView layoutIfNeeded];
    }];
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
