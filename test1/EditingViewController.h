//
//  EditingViewController.h
//  IDCardScanDemo
//
//  Created by  on 11-11-24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditingViewController : UIViewController
{
//    UITextField *_textField;
    UITextView *_textView;
}
@property (nonatomic, retain) NSString *dataSource;
//@property (nonatomic, assign) NSInteger selectNum;

@end
