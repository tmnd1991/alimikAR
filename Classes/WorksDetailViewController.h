//
//  WorksDetailViewController.h
//  AlimikApp
//
//  Created by Murgia Antonio on 13/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work.h"

@interface WorksDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) Work* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *SubtitleText;
@property (weak, nonatomic) IBOutlet UIWebView *ContetWebView;

@end
