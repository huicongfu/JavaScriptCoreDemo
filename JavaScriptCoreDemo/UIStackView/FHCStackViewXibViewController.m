//
//  FHCStackViewXibViewController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/12/5.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "FHCStackViewXibViewController.h"
#import "StackWidthLabel.h"

@interface FHCStackViewXibViewController ()

@property (weak, nonatomic) IBOutlet UILabel *whyVisitLabel;

@property (weak, nonatomic) IBOutlet UILabel *whatToSeeLabel;

@property (weak, nonatomic) IBOutlet UILabel *weatherInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *hideOrShowBtn;
@property (weak, nonatomic) IBOutlet UIStackView *twoStackview;

@end

@implementation FHCStackViewXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.whyVisitLabel.text = @"Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!Famous for its diversity of arts, finance, cuisine, fashion and entertainment, NYC will keep you hopping from dusk to dawn!";
    self.whatToSeeLabel.text = @"Must-see's include Central Park, The American Museum of Natural History, The Statue of Liberty, Radio City Music Hall and Chinatown.Must-see's include Central Park, The American Museum of Natural History, The Statue of Liberty, Radio City Music Hall and Chinatown.Must-see's include Central Park, The American Museum of Natural History, The Statue of Liberty, Radio City Music Hall and Chinatown.Must-see's include Central Park, The American Museum of Natural History, The Statue of Liberty, Radio City Music Hall and Chinatown.";
    self.weatherInfoLabel.text = @"NYC has a humid subtropical climate with cold and damp winters and hot and sticky summers.";
}

- (IBAction)hideOrShowBtnAction:(UIButton *)sender {
    BOOL isHide = self.weatherInfoLabel.hidden;
    [UIView animateWithDuration:0.25 animations:^{
        self.weatherInfoLabel.hidden = !isHide;
    }];
    self.twoStackview.hidden = isHide;
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
