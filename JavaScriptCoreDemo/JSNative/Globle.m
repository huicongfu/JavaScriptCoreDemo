//
//  Globle.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/19.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "Globle.h"

@implementation Globle

- (void)changeBackgroundColor:(JSValue *)value {
    self.ownerController.view.backgroundColor = [UIColor colorWithRed:value[@"r"].toDouble green:value[@"g"].toDouble blue:value[@"b"].toDouble alpha:value[@"a"].toDouble];
}


@end
