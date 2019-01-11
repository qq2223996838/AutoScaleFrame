//
//  AutoScaleFrame.m
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//

#import "AutoScaleFrame.h"

@implementation AutoScaleFrame

static AutoScaleFrame *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark------公共方法
+ (instancetype)sharedAutoScaleFrame{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}
- (instancetype) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    [self AutoSizeScale];
    self = [super init];
    return self;
}

#pragma mark------对外方法
+ (CGRect)CGASMakeX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.origin.x = x * ASF.autoSizeScaleX ;
    newFrame.origin.y = y * ASF.autoSizeScaleY + (iS_IPhoneX_All?ASF.autoSizeScaleY*iPhone_SNavH:0);
    newFrame.size.width = width * ASF.autoSizeScaleX ;
    newFrame.size.height = height * ASF.autoSizeScaleY ;
    
    return newFrame;
}

+ (CGRect)CGASKeepX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height Keep:(asKFrameType)k
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    CGFloat distanceX;
    CGFloat distanceY;
    
    switch (k) {
        case asKFrameXYWH:
            if ( x > iPhone6W/2 ) {
                
                distanceX = ScreenWidth - (iPhone6W - x) ;
                
            }else{
                distanceX = x;
            }
            
            if ( y > iPhone6H/2 ) {
                
                distanceY = Screen_Security_Hight - (iPhone6H - y) ;
                
            }else{
                distanceY =  y ;
            }
            newFrame.origin.x = distanceX  ;
            newFrame.origin.y = distanceY  ;
            newFrame.size.width = width ;
            newFrame.size.height = height ;
            break;
        case asKFrameXY:
            if ( x > iPhone6W/2 ) {
                float increaseWidth = width * ASF.autoSizeScaleX - width;
                distanceX = ScreenWidth - (iPhone6W - x) - increaseWidth ;
                
            }else{
                distanceX = x;
            }
            
            if ( y > iPhone6H/2 ) {
                float increaseHeight = height * ASF.autoSizeScaleY - height;
                distanceY = Screen_Security_Hight - (iPhone6H - y) - increaseHeight;
                
            }else{
                distanceY =  y ;
            }
            newFrame.origin.x = distanceX ;
            newFrame.origin.y = distanceY ;
            newFrame.size.width = width * ASF.autoSizeScaleX ;
            newFrame.size.height = height * ASF.autoSizeScaleY ;
            break;
        case asKFrameWH:
            newFrame.origin.x = x * ASF.autoSizeScaleX ;
            newFrame.origin.y = y * ASF.autoSizeScaleY ;
            newFrame.size.width = width ;
            newFrame.size.height = height ;
            break;
        case asKFrameX:
            if ( x > iPhone6W/2 ) {
                float increaseWidth = width * ASF.autoSizeScaleX - width;
                distanceX = ScreenWidth - (iPhone6W - x) - increaseWidth ;
                
            }else{
                distanceX = x;
            }
            newFrame.origin.x = distanceX ;
            newFrame.origin.y = y * ASF.autoSizeScaleY ;
            newFrame.size.width = width * ASF.autoSizeScaleX ;
            newFrame.size.height = height * ASF.autoSizeScaleY ;
            break;
        case asKFrameY:
            if ( y > iPhone6H/2 ) {
                float increaseHeight = height * ASF.autoSizeScaleY - height;
                distanceY = Screen_Security_Hight - (iPhone6H - y) - increaseHeight;
                
            }else{
                distanceY =  y ;
            }
            newFrame.origin.x = x * ASF.autoSizeScaleX ;
            newFrame.origin.y = distanceY ;
            newFrame.size.width = width * ASF.autoSizeScaleX ;
            newFrame.size.height = height * ASF.autoSizeScaleY ;
            break;
        case asKFrameW:
            newFrame.origin.x = x * ASF.autoSizeScaleX ;
            newFrame.origin.y = y * ASF.autoSizeScaleY ;
            newFrame.size.width = width ;
            newFrame.size.height = height * ASF.autoSizeScaleY ;
            break;
        case asKFrameH:
            newFrame.origin.x = x * ASF.autoSizeScaleX ;
            newFrame.origin.y = y * ASF.autoSizeScaleY ;
            newFrame.size.width = width * ASF.autoSizeScaleX ;
            newFrame.size.height = height ;
            break;
    }
    
    return newFrame;
}

+ (CGFloat)CGASMakeX:(CGFloat) x
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.origin.x = x * ASF.autoSizeScaleX ;
    return newFrame.origin.x;
}
+ (CGFloat)CGASMakeY:(CGFloat) y
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.origin.y = y * ASF.autoSizeScaleY;
    return newFrame.origin.y;
}
+ (CGFloat)CGASMakeW:(CGFloat) W
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.size.width = W * ASF.autoSizeScaleX ;
    return newFrame.size.width;
}
+ (CGFloat)CGASMakeH:(CGFloat) H
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.size.height = H * ASF.autoSizeScaleY ;
    return newFrame.size.height;
}

#pragma mark------本地方法
- (float)autoSizeScaleX{
    return _autoSizeScaleX;
}
- (float)autoSizeScaleY{
    return _autoSizeScaleY;
}

#pragma mark------计算一次缩放比例
- (void)AutoSizeScale{
    
    _autoSizeScaleX = ScreenWidth/RealUISrceenWidth;
    _autoSizeScaleY = Screen_Calculate_Hight/RealUISrceenHight;
}

@end
