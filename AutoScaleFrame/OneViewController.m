//
//  OneViewController.m
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/7.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import "OneViewController.h"
#import "AutoScaleFrameHM/AutoScaleFrameMain.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self testFrameUI];
}

- (void)testFrameUI
{
    
    UIView *testView1 = [[UIView alloc]init];
    testView1.frame = asKFrame(10, 10, 100, 100, asKFrameXY);
    testView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView1];
    
    UIView *testView2 = [[UIView alloc]init];
    testView2.frame = asFrame(200, 200, 100, 100);
    testView2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView2];
    UIView *testView22 = [[UIView alloc]init];
    testView22.frame = asFrame(100, 300, 100, 100);
    testView22.backgroundColor = [UIColor greenColor];
    [self.view addSubview:testView22];
    
    UIView *testView3 = [[UIView alloc]init];
    testView3.frame = asKFrame(iPhone6W-110, iPhone6H-150, 100, 100,asKFrameXY);
    testView3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:testView3];
    
    return;
}


@end
