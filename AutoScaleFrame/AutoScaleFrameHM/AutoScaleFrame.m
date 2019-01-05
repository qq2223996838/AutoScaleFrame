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
    newFrame.origin.y = y * ASF.autoSizeScaleY + (isIPhoneX ?88:0);
    newFrame.size.width = width * ASF.autoSizeScaleX ;
    newFrame.size.height = height * ASF.autoSizeScaleY ;
    
    return newFrame;
}

+ (CGRect)CGASKeepX:(CGFloat) x Y:(CGFloat) y width:(CGFloat) width height:(CGFloat) height
{
    AutoScaleFrame *ASF = [AutoScaleFrame sharedAutoScaleFrame];
    
    CGRect newFrame;
    newFrame.origin.x = x * ASF.autoSizeScaleX ;
    newFrame.origin.y = y * ASF.autoSizeScaleY + (isIPhoneX ?88:0);
    newFrame.size.width = width ;
    newFrame.size.height = height ;
    
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
    newFrame.origin.y = y * ASF.autoSizeScaleY + (isIPhoneX ?88:0);
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
    _autoSizeScaleY = ScreenHight/RealUISrceenHight;
}

@end
