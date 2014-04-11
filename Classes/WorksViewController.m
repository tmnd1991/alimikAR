//
//  WorksViewController.m
//  AlimikApp
//
//  Created by Murgia Antonio on 14/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "WorksViewController.h"
#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
@interface WorksViewController ()

@end

@implementation WorksViewController

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
  if (!isiPhone5)
  {
    self.animationHeightConstraint.constant = 90;
    self.industryHeightConstraint.constant = 90;
    self.architectureHeightConstraint.constant = 90;
    self.appsHeightConstraint.constant = 90;
    [[self view]layoutIfNeeded];
  }
//    self.textViewHeightConstraint.constant = textView.contentSize.height;
//    [self.scrollView layoutIfNeeded];
  /*
    if (!isiPhone5)
    {
      int delta=0;
      int offset = 20;
      CGSize newSize = CGSizeMake(280, 95);
      CGRect buttonFrame = self.animationButton.frame;
      buttonFrame.origin = CGPointMake(buttonFrame.origin.x, buttonFrame.origin.y);
      buttonFrame.size = newSize;
      self.animationButton.frame = buttonFrame;
      
      delta+=offset;
      
      buttonFrame = self.industryButton.frame;
      buttonFrame.origin = CGPointMake(buttonFrame.origin.x, buttonFrame.origin.y-delta);
      buttonFrame.size = CGSizeMake(280, 90);
      self.industryButton.frame = buttonFrame;
      
      delta+=offset;
      
      buttonFrame = self.architectureButton.frame;
      buttonFrame.origin = CGPointMake(buttonFrame.origin.x, buttonFrame.origin.y-delta);
      buttonFrame.size = newSize;
      self.architectureButton.frame = buttonFrame;
      
      delta+=offset;
      
      buttonFrame = self.appsButton.frame;
      buttonFrame.size = newSize;
      buttonFrame.origin = CGPointMake(buttonFrame.origin.x, buttonFrame.origin.y-delta);
      self.appsButton.frame = buttonFrame;
    }
  */
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToWorks:(UIStoryboardSegue *)unwindSegue
{
}

@end
