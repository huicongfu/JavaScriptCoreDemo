//
//  MyObject.h
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/19.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyObjectProtocol <JSExport>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, assign) NSInteger age;
- (void)sayHi;

@end

@interface MyObject : NSObject<MyObjectProtocol>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, assign) NSInteger age;


@end

NS_ASSUME_NONNULL_END
