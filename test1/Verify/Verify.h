//
//  Verify.h
//  IDCardDemo
//
//  Created by  on 14-04-16.
//  Copyright (c) 2014年 ibokanwisdom. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VerifyConnentionDataDelegate;
@interface Verify : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData          *_receiveData;
}

@property (nonatomic, assign) id<VerifyConnentionDataDelegate> delegate;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *cardNO;


- (id)initWithName:(NSString*)name IDCard:(NSString*)cardNO;
- (void)start;

@end

@protocol VerifyConnentionDataDelegate <NSObject>

@optional
- (void)verifyWriteByte:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite;

- (void)showResult:(NSInteger) result baseString:(NSString*)bodyString;
@end