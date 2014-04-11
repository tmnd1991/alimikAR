//
//  HomeViewController.m
//  AlimikApp
//
//  Created by Murgia Antonio on 23/01/14.
//  Copyright (c) 2014 metaio GmbH. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
  if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
  {
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"home_ipad" withExtension:@"html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
  }
  else
  {
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"home_iphone" withExtension:@"html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)dealloc {
  [_webView release];
  [super dealloc];
}
*/
@end
