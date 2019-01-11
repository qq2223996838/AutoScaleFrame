//
//  AutoScaleFrame.h
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AutoScaleFrameMain.h"

typedef enum {
    asKFrameXYWH, //保持边距宽高不变
    asKFrameXY, // 保持XY边距不变
    asKFrameWH, // 保持宽高不变
    asKFrameX, // 保持X边距不变
    asKFrameY, // 保持Y边距不变
    asKFrameW, // 保持宽度不变
    asKFrameH  // 保持高度不变
} asKFrameType;

/** 这个参数,看公司项目UI图 具体是哪款机型,默认  iphone6
 RealUISrceen
 4/4s  -- 480
 5/5s  -- 568
 6/6s/7/7s/8  -- 667
 6p/6sp/7p/7sp/8p  -- 736
 x  -- 812
 */
static const float  RealUISrceenHight =  667.0;
/**
 RealUISrceen
 4/4s 5/5s  -- 320
 6/6s/7/7s/8  -- 375
 6p/6sp/7p/7sp/8p  -- 414
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
+ (CGRect)CGASKeepX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height Keep:(asKFrameType)k;

/** 返回新 x/y/w/h
 * 传入 当前 x/y/w/h
 */
+ (CGFloat)CGASMakeX:(CGFloat) x;
+ (CGFloat)CGASMakeY:(CGFloat) y;
+ (CGFloat)CGASMakeW:(CGFloat) W;
+ (CGFloat)CGASMakeH:(CGFloat) H;



@end
