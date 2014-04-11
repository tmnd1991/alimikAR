//
//  WorksViewController.h
//  AlimikApp
//
//  Created by Murgia Antonio on 14/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorksViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *animationButton;
@property (weak, nonatomic) IBOutlet UIButton *industryButton;
@property (weak, nonatomic) IBOutlet UIButton *architectureButton;
@property (weak, nonatomic) IBOutlet UIButton *appsButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animationHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *industryHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *architectureHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *appsHeightConstraint;

- (IBAction)unwindToWorks:(UIStoryboardSegue *)unwindSegue;
@end
