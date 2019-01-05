//
//  ViewController.m
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import "ViewController.h"

#import "AutoScaleFrameMain.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testFrameUI];
}


- (void)testFrameUI
{
    
    UIView *testView = [[UIView alloc]init];
    testView.frame = asFrame(10, 10, iPhone6W - 20, iPhone6H -20);
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    
    UIView *testView1 = [[UIView alloc]init];
    testView1.frame = [AutoScaleFrame CGASMakeX:iPhone6W/2 Y:iPhone6H/2 width:100 height:100];
    testView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView1];
    
    UIView *testView2 = [[UIView alloc]init];
    testView2.frame = CGRectMake(ScreenWidth/2, ScreenHight/2, 100, 100);
    testView2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView2];
    
    NSLog(@"位置 --  %f --- %f",
          testView.frame.size.width,
          testView.frame.size.height);
    
    return;
}


@end
