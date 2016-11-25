//
//  CameraViewController.m
//  IDCardScanDemo
//
//  Created by  on 11-11-22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

#define kAccelerationThreshold		1.01
#define kAccelerationMinValue		0.02

#define kUpdateInterval			(1.0f/5.0f)

#define kDesiredAntiShakeCount		1*1/kUpdateInterval

#define kAccelerationDelta			0.02

@implementation CameraViewController

@synthesize pickerController = _pickerController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}

*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _cameraView = [[CameraView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 420.0f)];
    [_cameraView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_cameraView];
    [_cameraView startHeartBeat];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)dealloc
{
    [_cameraView release];
    [super dealloc];
}
#pragma mark - 
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    UIAccelerationValue deltaX = acceleration.x - accelX;
    UIAccelerationValue deltaY = acceleration.y - accelY;
    UIAccelerationValue deltaZ = acceleration.z - accelZ;
    
    if (deltaX < kAccelerationDelta && deltaY < kAccelerationDelta && deltaZ <kAccelerationDelta) {
        antiShakeCount++;
        [_cameraView changeBoundColor:[UIColor greenColor]];
    }
    else
    {
        [_cameraView changeBoundColor:[UIColor redColor]];
        antiShakeCount = 0;
    }
    
    if (antiShakeCount == kDesiredAntiShakeCount) {
        NSLog(@"开始采集照片");
    }
    
    accelX = acceleration.x;
    accelY = acceleration.y;
    accelZ = acceleration.z;
    [pool release];
}
@end
