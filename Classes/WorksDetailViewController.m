//
//  WorksDetailViewController.m
//  AlimikApp
//
//  Created by Murgia Antonio on 13/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "WorksDetailViewController.h"

@interface WorksDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation WorksDetailViewController 

#pragma mark - Managing the detail item

- (void)setDetailItem:(Work*)newDetailItem
{
  if (_detailItem != newDetailItem) {
    _detailItem = newDetailItem;
    // Update the view.
    [self configureView];
  }
  
  if (self.masterPopoverController != nil) {
    [self.masterPopoverController dismissPopoverAnimated:YES];
  }
}

- (void)configureView
{
  // Update the user interface for the detail item.
  
  if (self.detailItem) {
    self.title = self.detailItem.title;
    self.SubtitleText.text = [self.detailItem subtitle];
    [self.ContetWebView loadRequest:[NSURLRequest requestWithURL:self.detailItem.ipadContentUrl]];
//    [self.ContetWebView loadHTMLString:[self.detailItem content] baseURL:[self.detailItem baseUrl]];
    self.ContetWebView.scalesPageToFit = YES;
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
  barButtonItem.title = NSLocalizedString(@"Works", @"Works");
  [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
  self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
  // Called when the view is shown again in the split view, invalidating the button and popover controller.
  [self.navigationItem setLeftBarButtonItem:nil animated:YES];
  self.masterPopoverController = nil;
}

@end
