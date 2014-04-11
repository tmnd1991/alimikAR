//
//  ContactsViewController.h
//  AlimikApp
//
//  Created by Murgia Antonio on 23/01/14.
//  Copyright (c) 2014 metaio GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContactsViewController : UIViewController <MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)mapModeChange:(id)sender;

@end
