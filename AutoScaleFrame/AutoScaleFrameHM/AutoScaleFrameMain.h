//
//  AutoScaleFrameMain.h
//  AutoScaleFrame
//
//  Created by mooer on 2019/1/5.
//  Copyright © 2019年 mooer. All rights reserved.
//


#ifndef AutoScaleFrameMain_h
#define AutoScaleFrameMain_h

#import "AutoScaleFrame.h"

//iPhone 6 WH
#define iPhone6W 375
#define iPhone6H 667

#define asFrame(x,y,w,h) [AutoScaleFrame CGASMakeX:(x) Y:(y) width:(w) height:(h)]

#define asKFrame(x,y,w,h) [AutoScaleFrame CGASKeepX:(x) Y:(y) width:(w) height:(h)]

#define asFrameX(x) [AutoScaleFrame CGASMakeX:(x)]
#define asFrameY(y) [AutoScaleFrame CGASMakeY:(y)]
#define asFrameW(w) [AutoScaleFrame CGASMakeW:(w)]
#define asFrameH(h) [AutoScaleFrame CGASMakeH:(h)]


#endif /* AutoScaleFrameMain_h */
