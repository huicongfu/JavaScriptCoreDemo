//
//  MyHitTestView.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/21.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "MyHitTestView.h"

@implementation MyHitTestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _circleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _circleBtn.backgroundColor = [UIColor blueColor];
        _circleBtn.frame = CGRectMake(25, -25, 50, 50);
        [_circleBtn addTarget:self action:@selector(circleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_circleBtn];
    }
    return self;
}

- (void)circleBtnClick {
    NSLog(@"circle btn click");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint newPoint = [self convertPoint:point toView:self.circleBtn];
    if ([self pointInside:newPoint withEvent:event]) {
        return self.circleBtn;
    }else {
        return [super hitTest:point withEvent:event];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
