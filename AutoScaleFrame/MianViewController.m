//
//  MianViewController.m
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/7.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import "MianViewController.h"
#import "AutoScaleFrameMain.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface MianViewController ()<UITabBarDelegate,UITabBarControllerDelegate>

@property(nonnull,nonatomic,strong)UITabBarController *mainTabbarController;

@end

@implementation MianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//   self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.title=@"one VC";

    _mainTabbarController=[[UITabBarController alloc]init];
    
    _mainTabbarController.delegate = self;
    _mainTabbarController.view.frame=CGRectMake(0,iPhone_Top_NavH, ScreenWidth, Screen_Security_Hight - 64);
    _mainTabbarController.tabBar.frame=CGRectMake(0, GetVH(_mainTabbarController.view)-iPhone_Bottom_NavH, ScreenWidth, iPhone_Bottom_NavH);
    
    
    //设置标题tabBar点击后字体颜色
    _mainTabbarController.tabBar.tintColor = [UIColor greenColor];
    
    CGRect frame = CGRectMake(0, 0, ScreenWidth, iPhone_Bottom_NavH);
    UIView *tabBG = [[UIView alloc] initWithFrame:frame];
    tabBG.backgroundColor = [UIColor blackColor];
    [_mainTabbarController.tabBar insertSubview:tabBG atIndex:0];
    _mainTabbarController.tabBar.opaque = YES;
    
    OneViewController *VC1=[[OneViewController alloc]init];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"oneVC" image:[UIImage imageNamed:@"mianVC_tab_nav"] tag:0];
    VC1.tabBarItem = item1;
    
    TwoViewController *VC2=[[TwoViewController alloc]init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"two" image:[UIImage imageNamed:@"mianVC_tab_nav"] tag:1];
    VC2.tabBarItem = item2;
    
    ThreeViewController *VC3=[[ThreeViewController alloc]init];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"three" image:[UIImage imageNamed:@"mianVC_tab_nav"] tag:2];
    VC3.tabBarItem = item3;
    
    _mainTabbarController.viewControllers=@[VC1,VC2,VC3];
    
    UITabBar *tabBar = _mainTabbarController.tabBar;

    UITabBarItem *item01 = [tabBar.items objectAtIndex:0];
    item01.selectedImage = [[UIImage imageNamed:@"mianVC_tab_nav_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item01.image = [[UIImage imageNamed:@"mianVC_tab_nav"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item02 = [tabBar.items objectAtIndex:1];
    item02.selectedImage = [[UIImage imageNamed:@"mianVC_tab_nav_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item02.image = [[UIImage imageNamed:@"mianVC_tab_nav"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item03 = [tabBar.items objectAtIndex:2];
    item03.selectedImage = [[UIImage imageNamed:@"mianVC_tab_nav_click"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item03.image = [[UIImage imageNamed:@"mianVC_tab_nav"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.view addSubview:_mainTabbarController.view];
    
}


- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UIViewController*)viewController
{
    
    if ([viewController isKindOfClass:[OneViewController class]]) {
        
        self.navigationItem.title=@"one VC";
        
    }
    if ([viewController isKindOfClass:[TwoViewController class]]) {
        
        self.navigationItem.title=@"two VC";
        
    }
    if ([viewController isKindOfClass:[ThreeViewController class]]) {
        
        self.navigationItem.title=@"three VC";
        
    }
    
    return YES;
}

@end
