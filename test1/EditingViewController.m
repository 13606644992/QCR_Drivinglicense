//
//  EditingViewController.m
//  IDCardScanDemo
//
//  Created by  on 11-11-24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "EditingViewController.h"

@implementation EditingViewController

@synthesize dataSource = _dataSource;

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
//- (void)save
//{
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    NSString *string = _textField.text;
//    [self.dataSource replaceObjectAtIndex:self.selectNum withObject:string];
//    [[[self.navigationController viewControllers] objectAtIndex:0] setValue:self.dataSource forKey:@"dataSource"] ;
//    [pool release];
//}
- (void)viewDidLoad
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
    {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 80, 280, 400)];
    }
    else
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 280, 400)];
    
    _textView.scrollEnabled = YES;
    _textView.editable = NO;
    _textView.text = self.dataSource;

    [self.view addSubview:_textView];
    
    [pool release];
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
    [_dataSource release];
    [_textView release];
    [super dealloc];
}
@end
