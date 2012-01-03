//
//  InfoController.m
//  QRCodeSacnner
//
//  Created by Chih Wei Yang on 11/12/28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "InfoController.h"

@implementation InfoController
@synthesize resultsView;
@synthesize dataString;
@synthesize listData;
@synthesize action;
@synthesize image;
@synthesize imageView;

-(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

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
    resultsView.text = self.dataString;
    imageView.image = self.image;
    NSString * filepase = [self dataFilePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepase])
        self.listData = [NSMutableArray arrayWithContentsOfFile:filepase];
    else
        self.listData = [[NSMutableArray alloc] init];
    
    if ([listData count] == 10)
    {
        [listData removeObjectAtIndex:0];
    }
    
    [listData addObject:self.dataString];
    [listData writeToFile:filepase atomically:YES];
    [action performActionWithController:self shouldConfirm:YES];
}


- (void)viewDidUnload
{
    resultsView = nil;
    dataString = nil;
    listData = nil;
    action = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [resultsView release];
    [dataString release];
    [listData release];
    [action release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
