//
//  CameraViewController.h
//  IDCardScanDemo
//
//  Created by  on 11-11-22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraView.h"

@interface CameraViewController : UIViewController<UIAccelerometerDelegate>
{
    CameraView          *_cameraView;
    UIAccelerometer     *_accel;
    
    UIAccelerationValue accelX;
    UIAccelerationValue accelY;
    UIAccelerationValue accelZ;
    
    NSInteger antiShakeCount;
}


@property (nonatomic, retain) UIImagePickerController *pickerController;

@end
