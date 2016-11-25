//
//  CameraView.m
//  Camera
//
//  Created by  on 11-11-22.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "CameraView.h"
#define kTimeInterval	0.2f

@implementation CameraView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        boundColor = [UIColor grayColor];
        beat = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    if (beat==YES) {
        CGContextSetStrokeColorWithColor(currentContext, [boundColor CGColor]);
        if (boundColor == [UIColor greenColor] || boundColor == [UIColor redColor]) {
            beat = NO;
        }
        else
        {
            CGContextSetStrokeColorWithColor(currentContext, [[UIColor grayColor] CGColor]);
        }
    }
    
    CGContextSetLineWidth(currentContext, 4);
    //line 1 left-up
    CGPoint newPoints1[] = {
        CGPointMake(38.0f, 48.0f),
        CGPointMake(38.0f, 8.0f),
        CGPointMake(78.0f, 8.0f)
    };
    CGContextAddLines(currentContext, newPoints1, 3);
    CGContextStrokePath(currentContext);
    //line 2 right-up
    CGPoint newPoints2[] = {
        CGPointMake(282.0f, 48.0f),
        CGPointMake(282.0f, 8.0f),
        CGPointMake(242.0f, 8.0f)
    };
    CGContextAddLines(currentContext, newPoints2, 3);
    CGContextStrokePath(currentContext);
    //line 3 left-down
    CGPoint newPoints3[] = {
        CGPointMake(38.0f, 360.0f),
        CGPointMake(38.0f, 400.0f),
        CGPointMake(78.0f, 400.0f)
    };
    CGContextAddLines(currentContext, newPoints3, 3);
    CGContextStrokePath(currentContext);
    //line 4 right-down
    CGPoint newPoints4[] = {
        CGPointMake(282.0f, 360.0f),
        CGPointMake(282.0f, 400.0f),
        CGPointMake(242.0f, 400.0f)
    };
    CGContextAddLines(currentContext, newPoints4, 3);
    CGContextStrokePath(currentContext);
}

- (void)changeBoundColor:(UIColor*)color
{
    boundColor = color;
}
//
- (void)heartBeat
{
    [self setNeedsDisplay];
}
- (void)startHeartBeat
{
    [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(heartBeat) userInfo:nil repeats:YES];
}

@end
