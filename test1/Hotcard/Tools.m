//
//  Tools.m
//  IDCardScanDemo
//
//  Created by Historia Jee on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tools.h"

@implementation Tools

#pragma mark - scale and cut image
+ (UIImage*)scaleOriginalImage:(UIImage*)originalImage rect:(CGRect)imageRect
{
    UIImage *orgImage = [originalImage retain];
    
    float scale = 0.0;
    if (orgImage.size.width > orgImage.size.height) {
        scale = imageRect.size.width / 480;
    }
    
    UIGraphicsBeginImageContext(imageRect.size);
    [orgImage drawInRect:imageRect];
    [orgImage release];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

+ (UIImage*)cutOriginalImage:(UIImage*)originalImage rect:(CGRect)orgRect
{
    UIImage *orgImage = [orgImage retain];
    CGImageRef orgRef = [orgImage CGImage];
    [orgImage release];
    CGImageRef newRef = CGImageCreateWithImageInRect(orgRef, orgRect);
    CGImageRelease(orgRef);
    UIImage *image = [[UIImage alloc] initWithCGImage:newRef];
    return [image autorelease];
}
#pragma mark - write and read image
+ (BOOL)writeImage:(UIImage*)originalImage toFile:(NSString*)file
{
    UIImage *orgImage = [originalImage retain];
    NSString *orgFile = [file retain];
    
    NSData *data = UIImagePNGRepresentation(orgImage);
    [orgImage release];
    
    NSError *error = nil;
    if([data writeToFile:orgFile options:NSDataWritingAtomic error:&error])
    {
        return YES;
    }
    NSLog(@"writeImageError:%@",error);
    return NO;
}
+ (BOOL)readImage:(UIImage*)targetImage fromFile:(NSString*)file
{
    NSString *orgFile = [file retain];
    
    NSError *error = nil;
    NSData *data = [[NSData alloc] initWithContentsOfFile:orgFile options:NSDataWritingAtomic error:&error];
    if (error) {
        return NO;
    }
    UIImage *currentImage = [[UIImage alloc] initWithData:data];
    targetImage = currentImage;
    [currentImage release];
    return YES;
}
#pragma mark - create file by filename and dirctory
+ (NSString*)createFile:(NSString*)fileName directory:(NSString*)dirctory
{
    NSString *orgName = [fileName retain];
    NSString *orgDirctory = [dirctory retain];
    
    NSString *file = [[NSString alloc] initWithString:orgDirctory];
    [orgDirctory release];
    file = [file stringByAppendingPathComponent:orgName];
    [orgName release];
    return [file autorelease];
}
@end
