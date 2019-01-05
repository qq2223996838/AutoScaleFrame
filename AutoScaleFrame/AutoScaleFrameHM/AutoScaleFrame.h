//
//  AutoScaleFrame.h
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//判断是否 iPhone X
#define isIPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

/** 视觉安全区域 W H
 * 宽：获取全屏宽度 无处理
 * 高：如果是iPhone X - 122 xp 高度
      iPhone X  --  tabbar 有 34xp || navbar 有 88xp  安全区域
 */

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHight (isIPhoneX ? [UIScreen mainScreen].bounds.size.height - 34 - iPhoneXnavbarH : [UIScreen mainScreen].bounds.size.height)


/** 设置默认 iPhone X 导航栏 高度 88xp */
#define iPhoneXnavbarH 88.0f

/** 这个参数,看公司项目UI图 具体是哪款机型,默认  iphone6
 RealUISrceen
 4/4s  -- 480
 5/5s  -- 568
 6/6s/7/7s  -- 667
 6p/6sp/7p/7sp  -- 736
 x  -- 812
 */
static const float  RealUISrceenHight =  667.0;
/**
 RealUISrceen
 4/4s 5/5s  -- 320
 6/6s/7/7s  -- 375
 6p/6sp/7p/7sp  -- 414
 x  -- 375
 */
static const float RealUISrceenWidth = 375.0;


@interface AutoScaleFrame : NSObject
{
    /**  宽度缩放的比例  */
    float _autoSizeScaleX;
    /**  高度缩放的比例  */
    float _autoSizeScaleY;
}

#pragma mark-----------Commonly used method


+ (AutoScaleFrame*)sharedAutoScaleFrame;

/** 返回新Frame
 * 传入 当前 Frame 参数
 */
+ (CGRect)CGASMakeX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height;

/** 返回新位置，但宽高不变的Frame
 * 传入 当前 Frame 参数
 * 只改变 适配的位置 ；大小保持原样
 */
+ (CGRect)CGASKeepX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height;

/** 返回新 x/y/w/h
 * 传入 当前 x/y/w/h
 */
+ (CGFloat)CGASMakeX:(CGFloat) x;
+ (CGFloat)CGASMakeY:(CGFloat) y;
+ (CGFloat)CGASMakeW:(CGFloat) W;
+ (CGFloat)CGASMakeH:(CGFloat) H;



@end
