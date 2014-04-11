//
//  ContactsViewController.m
//  AlimikApp
//
//  Created by Murgia Antonio on 23/01/14.
//  Copyright (c) 2014 metaio GmbH. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()
- (void) setAnnotations:(MKMapView *)mapView;
@property MKPointAnnotation *myAnnotation;
@end

@implementation ContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setAnnotations: self.mapView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
  [self setAnnotations:self.mapView];
}

- (IBAction)mapModeChange:(id)sender {
  UISegmentedControl *mapTypeControl = sender;
  switch([mapTypeControl selectedSegmentIndex])
  {
    case 0:
      [_mapView setMapType:MKMapTypeStandard]; break;
    case 1:
      [_mapView setMapType:MKMapTypeHybrid]; break;
  }
}

- (IBAction)metodo:(id)sender {
}

- (IBAction)openMaps:(id)sender{
  MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(44.514877,11.374249) addressDictionary:nil];
  MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
  item.name = @"Alimik snc";
  [item openInMapsWithLaunchOptions:nil];
}

- (void) setAnnotations:(MKMapView *)mapView {
  self.myAnnotation = [[MKPointAnnotation alloc] init];
  [self.myAnnotation setCoordinate:CLLocationCoordinate2DMake(44.514877,11.374249)];
  [self.myAnnotation setTitle:@"Alimik snc"];
  [self.mapView addAnnotation:self.myAnnotation];
  [mapView setRegion:[self regionForAnnotations:self.mapView]];
}

- (MKCoordinateRegion)regionForAnnotationsAndCurrentLocation:(MKMapView *)mapView {
  
  CLLocationDegrees minLat = 90.0;
  CLLocationDegrees maxLat = -90.0;
  CLLocationDegrees minLon = 180.0;
  CLLocationDegrees maxLon = -180.0;
  
  for (id <MKAnnotation> annotation in mapView.annotations) {
    if (annotation.coordinate.latitude < minLat) {
      minLat = annotation.coordinate.latitude;
    }
    if (annotation.coordinate.longitude < minLon) {
      minLon = annotation.coordinate.longitude;
    }
    if (annotation.coordinate.latitude > maxLat) {
      maxLat = annotation.coordinate.latitude;
    }
    if (annotation.coordinate.longitude > maxLon) {
      maxLon = annotation.coordinate.longitude;
    }
  }
  if (mapView.userLocation.coordinate.latitude < minLat) {
    minLat = mapView.userLocation.coordinate.latitude;
  }
  if (mapView.userLocation.coordinate.longitude < minLon) {
    minLon = mapView.userLocation.coordinate.longitude;
  }
  if (mapView.userLocation.coordinate.latitude > maxLat) {
    maxLat = mapView.userLocation.coordinate.latitude;
  }
  if (mapView.userLocation.coordinate.longitude > maxLon) {
    maxLon = mapView.userLocation.coordinate.longitude;
  }
  MKCoordinateSpan span = MKCoordinateSpanMake(maxLat - minLat, maxLon - minLon);
  CLLocationCoordinate2D center = CLLocationCoordinate2DMake((maxLat - span.latitudeDelta / 2), maxLon - span.longitudeDelta / 2);
//  span.longitudeDelta += 0.3;
//  span.latitudeDelta += 0.3;
  /*
  CLLocation *minLocation = [[CLLocation alloc]initWithLatitude:minLat longitude:minLon];
  CLLocation *maxLocation = [[CLLocation alloc]initWithLatitude:maxLat longitude:maxLon];
  CLLocationDistance distance = [minLocation distanceFromLocation:maxLocation];
  int latToAdd  = distance/4000000;
  int longToAdd = distance/4000000;
  span.latitudeDelta+=latToAdd;
  span.longitudeDelta+=longToAdd;
  */
  return MKCoordinateRegionMake(center, span);
}

- (MKCoordinateRegion)regionForAnnotations:(MKMapView *)mapView {
  
  CLLocationDegrees minLat = 90.0;
  CLLocationDegrees maxLat = -90.0;
  CLLocationDegrees minLon = 180.0;
  CLLocationDegrees maxLon = -180.0;
  
  for (id <MKAnnotation> annotation in mapView.annotations) {
    if (annotation.coordinate.latitude < minLat) {
      minLat = annotation.coordinate.latitude;
    }
    if (annotation.coordinate.longitude < minLon) {
      minLon = annotation.coordinate.longitude;
    }
    if (annotation.coordinate.latitude > maxLat) {
      maxLat = annotation.coordinate.latitude;
    }
    if (annotation.coordinate.longitude > maxLon) {
      maxLon = annotation.coordinate.longitude;
    }
  }
  MKCoordinateSpan span = MKCoordinateSpanMake(maxLat - minLat, maxLon - minLon);
  CLLocationCoordinate2D center = CLLocationCoordinate2DMake((maxLat - span.latitudeDelta / 2), maxLon - span.longitudeDelta / 2);
  //span.longitudeDelta += 0.3;
  //span.latitudeDelta += 0.3;
  /*
   CLLocation *minLocation = [[CLLocation alloc]initWithLatitude:minLat longitude:minLon];
   CLLocation *maxLocation = [[CLLocation alloc]initWithLatitude:maxLat longitude:maxLon];
   CLLocationDistance distance = [minLocation distanceFromLocation:maxLocation];
   int latToAdd  = distance/4000000;
   int longToAdd = distance/4000000;
   span.latitudeDelta+=latToAdd;
   span.longitudeDelta+=longToAdd;
   */
  return MKCoordinateRegionMake(center, span);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation {
  MKAnnotationView* aView = nil;
  if (annotation == self.myAnnotation)
  {
    aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Alimik snc"];
    aView.centerOffset = CGPointMake(10, -32);
    aView.image = [UIImage imageNamed:@"pin.png"];
    aView.enabled = YES;
    aView.canShowCallout = YES;
    //  aView.rightCalloutAccessoryView = [ UIButton buttonWithType:UIButtonTypeDetailDisclosure ];
    aView.rightCalloutAccessoryView = nil;
    UIImageView *aImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"alimik_logo.png"]];
    aView.leftCalloutAccessoryView = aImage;
    [aImage sizeToFit];
    [aView sizeToFit];
  }
  return aView;
}

/*
 - (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
 {
 [self setAnnotations:mapView];
 if (self.lastLocation==nil)
 {
 [mapView setRegion:[self regionForAnnotationsAndCurrentLocation:mapView] animated:YES];
 self.lastLocation = [userLocation location];
 }
 else
 {
 if ([self.lastLocation distanceFromLocation:[userLocation location]]>500)
 {
 [mapView setRegion:[self regionForAnnotationsAndCurrentLocation:mapView] animated:YES];
 }
 self.lastLocation = [userLocation location];
 }
 }
 */

@end
