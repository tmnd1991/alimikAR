//
//  WorksMasterViewController.h
//  AlimikApp
//
//  Created by Murgia Antonio on 13/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorksDetailViewController.h"

@interface WorksMasterViewController : UITableViewController

@property (strong, nonatomic) WorksDetailViewController *detailViewController;
@property (nonatomic, retain) NSArray *works;

@end
