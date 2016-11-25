//
//  CameraView.h
//  Camera
//
//  Created by  on 11-11-22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraView : UIView
{
    UIColor *boundColor;
    BOOL beat;
}
- (void)changeBoundColor:(UIColor*)color;
- (void)startHeartBeat;
@end
