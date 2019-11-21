//
//  Globle.h
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/19.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GlobleProtocol <JSExport>

- (void)changeBackgroundColor:(JSValue *)value;

@end

@interface Globle : NSObject<GlobleProtocol>

@property(nonatomic, weak)UIViewController * ownerController;

@end

NS_ASSUME_NONNULL_END
