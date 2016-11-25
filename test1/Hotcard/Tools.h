//
//  Tools.h
//  IDCardScanDemo
//
//  Created by Historia Jee on 11-12-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

//图片的缩放与裁剪
+ (UIImage*)scaleOriginalImage:(UIImage*)originalImage rect:(CGRect)imageRect;
+ (UIImage*)cutOriginalImage:(UIImage*)originalImage rect:(CGRect)orgRect;

//将图片写入指定的文件以及读取指定图片文件
+ (BOOL)writeImage:(UIImage*)originalImage toFile:(NSString*)file;
+ (BOOL)readImage:(UIImage*)targetImage fromFile:(NSString*)file;

//创建一个文件的绝对路径
+ (NSString*)createFile:(NSString*)fileName directory:(NSString*)dirctory;

@end
