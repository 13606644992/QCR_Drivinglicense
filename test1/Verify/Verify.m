//
//  Verify.m
//  IDCardDemo
//
//  Created by  on 14-04-16.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "Verify.h"
//https://api.nciic.com.cn/nciic_ws/services/NciicServices?wsdl
//http://ibokan.gicp.net/ibokan/nusoap/srv/srv.php

#define CHECK @"http://app.nciic.org.cn/nciic_ws/services/NciicServices"

NSArray *result;
@implementation Verify

@synthesize delegate = _delegate;
@synthesize name = _name, cardNO = _cardNO;

#pragma mark - init
- (id)initWithName:(NSString*)name IDCard:(NSString*)cardNO
{
    self = [super init];
    if (self) {
        self.name = name;
        self.cardNO = cardNO;
    }
    return self;
}

#pragma mark - Create SOAP Info
- (void)start
{

}

#pragma mark - connection delegate
- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_delegate verifyWriteByte:totalBytesWritten totalBytesExpectedToWrite:totalBytesExpectedToWrite];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    _receiveData = [[NSMutableData alloc] init];
    [pool release];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

}

//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
//{
//    
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
//{
//    
//}

#pragma mark - Memory management
- (void)dealloc
{
    [_name release];
    [_cardNO release];
    [super dealloc];
}
@end
