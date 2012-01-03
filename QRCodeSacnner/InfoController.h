//
//  InfoController.h
//  QRCodeSacnner
//
//  Created by Chih Wei Yang on 11/12/28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultAction.h"
#define kFilename @"data.plist"
@interface InfoController : UIViewController
{
    IBOutlet UITextView * resultsView;
    NSMutableArray * listData;
    NSString * dataString;
    UIImage * image;
    IBOutlet UIImageView * imageView;
    ResultAction * action;
}
@property (nonatomic, retain) NSMutableArray * listData;
@property (nonatomic, retain) IBOutlet UITextView *resultsView;
@property (strong) NSString * dataString;
@property (nonatomic, retain) IBOutlet UIImageView* imageView;
@property (strong) UIImage *image;
@property (strong) ResultAction * action;
-(NSString *)dataFilePath;
@end
