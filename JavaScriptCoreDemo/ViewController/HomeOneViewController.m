//
//  HomeOneViewController.m
//  JavaScriptCoreDemo
//
//  Created by fuhuicong-yfzx on 2019/11/18.
//  Copyright © 2019 fuhuicong-yfzx. All rights reserved.
//

#import "HomeOneViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "MyObject.h"
#import "Globle.h"
#import "MyHitTestView.h"

#define HEXCOLOR(hexValue)              [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : 1.0]

#define HEXACOLOR(hexValue, alphaValue) [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : (alphaValue)]


@interface HomeOneViewController ()

@property (nonatomic, retain) NSMutableArray * actionArray;
@property (nonatomic, retain) Globle * globle;

@end

@implementation HomeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testJSCore];
//    [self ocEvaluateScript];
//    [self ocEvaluateScriptFile];
//    [self scriptEvaluateOC];
//    [self render];
//    [self runJS_Hello];
//    [self ocEvaluateScriptFileTwo];
//    [self OCMapJS];
//    [self JSRenderOCUI];
//    [self testHitTestUI];
}

- (void)testHitTestUI {
    MyHitTestView * tetView = [[MyHitTestView alloc] init];
    [self.view addSubview:tetView];
    tetView.backgroundColor = [UIColor lightGrayColor];
    tetView.frame = CGRectMake(100, 150, 100, 100);
}

- (void)JSRenderOCUI {
    JSContext * con = [[JSContext alloc] init];
    self.globle = [Globle new];
    self.globle.ownerController = self;
    con[@"Globle"] = self.globle;
    self.actionArray = [NSMutableArray array];
    
    //render
    NSString * path = [[NSBundle mainBundle] pathForResource:@"JSRenderUIView" ofType:@"js"];
    NSData * jsData = [[NSData alloc]initWithContentsOfFile:path];
    NSString * jsCode = [[NSString alloc]initWithData:jsData encoding:NSUTF8StringEncoding];
    JSValue * jsVlaue = [con evaluateScript:jsCode];
    for (int i=0; i<jsVlaue.toArray.count; i++) {
        JSValue * subValue = [jsVlaue objectAtIndexedSubscript:i];
        if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Label"]) {
            UILabel * label = [UILabel new];
            label.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            label.text = subValue[@"text"].toString;
            label.textColor = [UIColor colorWithRed:subValue[@"color"][@"r"].toDouble green:subValue[@"color"][@"g"].toDouble blue:subValue[@"color"][@"b"].toDouble alpha:subValue[@"color"][@"a"].toDouble];
            [self.view addSubview:label];
        }else if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Button"]){
            UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            [button setTitle:subValue[@"text"].toString forState:UIControlStateNormal];
            button.tag = self.actionArray.count;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.actionArray addObject:subValue[@"callFunc"]];
            [self.view addSubview:button];
            
        }
    }
    
}

//按钮转换方法
-(void)buttonAction:(UIButton *)btn{
    JSValue * action  = self.actionArray[btn.tag];
    //执行JS方法
    [action callWithArguments:nil];
}


- (void)OCMapJS {
    MyObject * ob = [[MyObject alloc] init];
    ob.name = @"fu";
    ob.age = 25;
    ob.subject = @"OC";
    JSContext * con = [[JSContext alloc] init];
    [con setObject:ob forKeyedSubscript:@"deviceObject"];
    
}

- (void)testJSCore {
    // 创建一个JSContext对象
    JSContext * jsContext = [[JSContext alloc] init];
    
    // 执行JS代码 计算js变量a和b之和
    [jsContext evaluateScript:@"var a = 1; var b = 2;"];
    JSValue * resule = [jsContext evaluateScript:@"a+b"];
    NSInteger sum = [resule toInt32];
    NSLog(@"%ld",sum);
}

/// OC代码中执行JS语句
- (void)ocEvaluateScript {
    //创建一个JSContext对象
    JSContext * jsContext = [[JSContext alloc] init];
    
    //执行JS代码，计算js变量a和b之和
    [jsContext evaluateScript:@"var a = 1;var b = 2;"];
    NSInteger sum = [[jsContext evaluateScript:@"a + b"] toInt32];
    NSLog(@"%ld",sum); //3
    
    // 通过下标获取变量、方法
    [jsContext evaluateScript:@"var names = ['Same', 'Jack', 'Bob']"];
    JSValue * names = jsContext[@"names"];
    JSValue * initialName = names[0];
    NSLog(@"%@",initialName.toString);  //Same
    
    //定义方法并调用
    [jsContext evaluateScript:@"var addFunc = function(a,b) { return a + b}"];
    JSValue * result = [jsContext evaluateScript:@"addFunc(a, b)"];
    NSLog(@"%@", result.toNumber);  //3
    
    //可以OC传参
    JSValue * addFunc = jsContext[@"addFunc"];
    JSValue * addResult = [addFunc callWithArguments:@[@10, @30]];
    NSLog(@"%d", addResult.toInt32);    //40
}

/// OC代码中执行JS脚本内容
- (void)ocEvaluateScriptFile {
    JSContext * jsContext = [[JSContext alloc] init];
    NSString * path = [[NSBundle mainBundle] pathForResource:@"ocEvaluateScript" ofType:@"js"];
    NSString * layoutJS = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [jsContext evaluateScript:layoutJS];
    
    JSValue * subtractFunc = jsContext[@"subtractFunc"];
    JSValue * subtractResult = [subtractFunc callWithArguments:@[@20, @10]];
    NSLog(@"%d", subtractResult.toInt32);   //10
    
}

/// JS脚本执行OC代码
- (void)scriptEvaluateOC {
    JSContext * jsContext = [[JSContext alloc] init];
    jsContext[@"addFunc"] = ^(NSInteger a, NSInteger b) {
        return a + b;
    };
    
    JSValue * addResult = [jsContext evaluateScript:@"addFunc(3, 4)"];
    NSLog(@"%@", addResult.toNumber);   //7
    
    // setObject:forKeyedSubscript:方法用来向JSContext环境的全局对象中添加属性
    [jsContext setObject:^(NSInteger a, NSInteger b) {
        NSArray * args = [JSContext currentArguments];
        NSLog(@"args are %@", args);
        return a - b;
    } forKeyedSubscript:@"subtractFunc"];
    JSValue * subtractResult = [jsContext evaluateScript:@"subtractFunc(4, 3)"];
    NSLog(@"%@", subtractResult.toNumber); // 1
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"scriptEvaluateOC" ofType:@"js"];
    NSString * layoutJS = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [jsContext evaluateScript:layoutJS];
    
    
}

// JS热修复试验
- (void)render {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"view" ofType:@"js"];
    NSString * layoutJS = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    JSContext * jsCon = [[JSContext alloc] init];
    JSValue * subValue = [jsCon evaluateScript:layoutJS];
    
    UILabel * label = [UILabel new];
    label.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
    label.text = subValue[@"text"].toString;
    label.textColor = HEXCOLOR(subValue[@"color"].toInt32);
    [self.view addSubview:label];
    
    NSLog(@"%@",subValue[@"typeName"].toString);
}

//在Native中运行JavaScript脚本代码
- (void)runJS_Hello {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"mainTest" ofType:@"js"];
    JSContext * context = [[JSContext alloc] init];
    NSString * jsStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString * finStr = [NSString stringWithFormat:jsStr,@"'阿发达啊'"];
    [context evaluateScript:finStr];
}

/// 在JavaScript中调用Native方法
- (void)ocEvaluateScriptFileTwo {
    BOOL(^block)(NSString *) = ^(NSString * name) {
        NSLog(@"%@", [NSString stringWithFormat:@"Hello %@",name]);
        return YES;
    };
    
    JSContext * context = [[JSContext alloc] init];
    [context setObject:block forKeyedSubscript:@"oc_hello"];
    
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
