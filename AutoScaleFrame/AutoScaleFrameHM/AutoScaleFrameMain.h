//
//  AutoScaleFrameMain.h
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//


/** 注意事项
 *  根据具体项目设置 iPhone_Top_NavH  与 iPhone_Bottom_NavH
 
    1.iPhone_Top_NavH 上导航高度 推荐设置
      iPhone N 与 iPhone Puls  设置 64xp
      iPhone X 、iPhone Xs 、iPhone XR 、iPhone X Max 设置 88xp
 
    2.iPhone_Bottom_NavH 下导航栏高度 推荐设置
      iPhone N 与 iPhone Puls  设置 49xp
      iPhone X 、iPhone Xs 、iPhone XR 、iPhone X Max 设置 83xp
 
 */

#ifndef AutoScaleFrameMain_h
#define AutoScaleFrameMain_h

#import "AutoScaleFrame.h"

//iPhone 6 WH
#define iPhone6W 375
#define iPhone6H 667

//判断 iPhone X || 判断 iPhone Xs
#define isIPhoneX_Xs (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

//判断iPHoneXr || 判断iPhoneXs Max
#define isIPhoneXr_XsMax (CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))


//判断 iPhoneX 系列设备
#define iS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)


/** 视觉安全区域 W H
 * 宽：获取全屏宽度 无处理
 * 高：如果是iPhone X - 122 xp 高度
 iPhone X  --
 navbar 有 24xp + 64(自定义顶部导航栏高度) 安全区域
 tabbar 有 34xp + 49(自定义底部导航栏高度)
 */

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height

//外部 - 可用安全高度
#define Screen_Security_Hight (iS_IPhoneX_All ? [UIScreen mainScreen].bounds.size.height - iPhone_SNavH  - iPhone_SBottomNavH : [UIScreen mainScreen].bounds.size.height)

//框架内 - 计算高度(除去顶部导航、底部安全高度)
#define Screen_Calculate_Hight (iS_IPhoneX_All ? [UIScreen mainScreen].bounds.size.height - iPhone_Top_NavH -iPhone_Bottom_NavH : [UIScreen mainScreen].bounds.size.height)

/** 设置默认 iPhone X 导航栏 安全高度 */
#define iPhone_SNavH (iS_IPhoneX_All ? 24  : 0)

/** 设置默认 iPhone X 底部导航栏 安全高度 */
#define iPhone_SBottomNavH (iS_IPhoneX_All ? 34  : 0)

/** 设置默认 iPhone X 导航栏 高度 88xp  普通 64xp */
#define iPhone_Top_NavH (iS_IPhoneX_All ? iPhone_SNavH + 64 : 64)

/** 设置默认 iPhone X 底部导航栏 高度 83xp  普通 49xp */
#define iPhone_Bottom_NavH (iS_IPhoneX_All ? iPhone_SBottomNavH + 49 : 49)

//传控件 取该控件宽高
#define GetVW(view) (view.frame.size.width)
#define GetVH(view) (view.frame.size.height)

/** 适配方法接口 */

#define asFrame(x,y,w,h) [AutoScaleFrame CGASMakeX:(x) Y:(y) width:(w) height:(h)]

#define asFrameX(x) [AutoScaleFrame CGASMakeX:(x)]
#define asFrameY(y) [AutoScaleFrame CGASMakeY:(y)]
#define asFrameW(w) [AutoScaleFrame CGASMakeW:(w)]
#define asFrameH(h) [AutoScaleFrame CGASMakeH:(h)]

/** 需要固定方法接口 */

#define asKFrame(x,y,w,h,asKFrameType) [AutoScaleFrame CGASKeepX:(x) Y:(y) width:(w) height:(h) Keep:(asKFrameType)]






#endif /* AutoScaleFrameMain_h */
