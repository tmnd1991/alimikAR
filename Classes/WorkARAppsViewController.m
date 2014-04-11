//
//  WorkARAppsViewController.m
//  AlimikApp
//
//  Created by Murgia Antonio on 26/03/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "WorkARAppsViewController.h"
#import "WorksDealer.h"
#import "Work.h"

@interface WorkARAppsViewController ()

@end

@implementation WorkARAppsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Work *work = [WorksDealer getWorks][3];
    [self.webView loadRequest:[NSURLRequest requestWithURL:work.ipadContentUrl]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
