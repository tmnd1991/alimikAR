//
//  ARViewController.mm
//  AlimikApp
//
//  Created by Murgia Antonio on 23/01/14.
//  Copyright (c) 2014 metaio GmbH. All rights reserved.
//

#import "ARViewController.h"
#import "EAGLView.h"

@interface ARViewController ()

@end

@implementation ARViewController

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
  
  if( !m_metaioSDK )
  {
    NSLog(@"SDK instance is 0x0. Please check the license string");
    return;
  }
  
  
  // load our tracking configuration
  //NSString* trackingDataFile = [[NSBundle mainBundle] pathForResource:@"TrackingData_MarkerlessFast" ofType:@"xml" inDirectory:@"Assets"];
  NSString* trackingDataFile = [[NSBundle mainBundle] pathForResource:@"Tracking" ofType:@"xml" inDirectory:@"Assets"];
	int i = 1;
  if(trackingDataFile)
	{
		bool success = m_metaioSDK->setTrackingConfiguration([trackingDataFile UTF8String]);
		if( !success)
			NSLog(@"No success loading the tracking configuration");
	}

  NSString* michelinoModel = [[NSBundle mainBundle] pathForResource:@"4b07c60fbd029af7098ef801c9539357" ofType:@"zip" inDirectory:@"Assets"];
	if(michelinoModel)
	{
		// if this call was successful, theLoadedModel will contain a pointer to the 3D model
    metaio::IGeometry* michelinoLoadedModel =  m_metaioSDK->createGeometry([michelinoModel UTF8String]);
    if(michelinoLoadedModel)
    {
      michelinoLoadedModel->setCoordinateSystemID(i++);
      michelinoLoadedModel->setRotation(metaio::Rotation(1.57,0,0));
      // scale it a bit down
      //theLoadedModel->setScale(metaio::Vector3d(0.8,0.8,0.8));
    }
    else
    {
      NSLog(@"error, could not load %@", michelinoModel);
    }
  }
  NSString* video2 = [[NSBundle mainBundle] pathForResource:@"video2" ofType:@"3g2" inDirectory:@"Assets"];
  if (video2)
  {
    metaio::IGeometry* video2Loaded = m_metaioSDK->createGeometryFromMovie([video2 UTF8String]);
    if (video2Loaded)
    {
      video2Loaded->setCoordinateSystemID(i++);
    }
  }
  NSString* video3 = [[NSBundle mainBundle] pathForResource:@"video3" ofType:@"3g2" inDirectory:@"Assets"];
  if (video3)
  {
    metaio::IGeometry* video3Loaded = m_metaioSDK->createGeometryFromMovie([video3 UTF8String]);
    if (video3Loaded)
    {
      video3Loaded->setCoordinateSystemID(i++);
    }
  }
  NSString* video01 = [[NSBundle mainBundle] pathForResource:@"video01" ofType:@"mp4" inDirectory:@"Assets"];
  if (video01)
  {
    metaio::IGeometry* video01Loaded = m_metaioSDK->createGeometryFromMovie([video01 UTF8String]);
    if (video01Loaded)
    {
      video01Loaded->setCoordinateSystemID(i++);
    }
  }
  NSString* video02 = [[NSBundle mainBundle] pathForResource:@"video02" ofType:@"mp4" inDirectory:@"Assets"];
  if (video02)
  {
    metaio::IGeometry* video02Loaded = m_metaioSDK->createGeometryFromMovie([video02 UTF8String]);
    if (video02Loaded)
    {
      video02Loaded->setCoordinateSystemID(i++);
    }
  }
  NSString* video03 = [[NSBundle mainBundle] pathForResource:@"video03" ofType:@"mp4" inDirectory:@"Assets"];
  if (video03)
  {
    metaio::IGeometry* video03Loaded = m_metaioSDK->createGeometryFromMovie([video03 UTF8String]);
    if (video03Loaded)
    {
      video03Loaded->setCoordinateSystemID(i++);
    }
  }
  //NSLog(@"%@",i);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - @protocol metaioSDKDelegate

- (void) onSDKReady
{
  NSLog(@"The SDK is ready");
}

- (void) onAnimationEnd: (metaio::IGeometry*) geometry  andName:(NSString*) animationName
{
  NSLog(@"animation ended %@", animationName);
}


- (void) onMovieEnd: (metaio::IGeometry*) geometry  andName:(NSString*) movieName
{
	NSLog(@"movie ended %@", movieName);
	
}

- (void) onNewCameraFrame:(metaio::ImageStruct *)cameraFrame
{
  NSLog(@"a new camera frame image is delivered %f", cameraFrame->timestamp);
}

- (void) onCameraImageSaved:(NSString *)filepath
{
  NSLog(@"a new camera frame image is saved to %@", filepath);
}

-(void) onScreenshotImage:(metaio::ImageStruct *)image
{
  
  NSLog(@"screenshot image is received %f", image->timestamp);
}

- (void) onScreenshotImageIOS:(UIImage *)image
{
  NSLog(@"screenshot image is received %@", [image description]);
}

-(void) onScreenshot:(NSString *)filepath
{
  NSLog(@"screenshot is saved to %@", filepath);
}

- (void) onTrackingEvent:(const metaio::stlcompat::Vector<metaio::TrackingValues>&)trackingValues
{
  NSLog(@"The tracking time is: %f", trackingValues[0].timeElapsed);
}

- (void) onInstantTrackingEvent:(bool)success file:(NSString*)file
{
  if (success)
  {
    NSLog(@"Instant 3D tracking is successful");
  }
}

- (void) onVisualSearchResult:(bool)success error:(NSString *)errorMsg response:(std::vector<metaio::VisualSearchResponse>)response
{
  if (success)
  {
    NSLog(@"Visual search is successful");
  }
}

- (void) onVisualSearchStatusChanged:(metaio::EVISUAL_SEARCH_STATE)state
{
  if (state == metaio::EVSS_SERVER_COMMUNICATION)
  {
    NSLog(@"Visual search is currently communicating with the server");
  }
}

#pragma mark - Handling Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  // Here's how to pick a geometry
	UITouch *touch = [touches anyObject];
	CGPoint loc = [touch locationInView:glView];
	
  // get the scale factor (will be 2 for retina screens)
  float scale = glView.contentScaleFactor;
  
	// ask SDK if the user picked an object
	// the 'true' flag tells SDK to actually use the vertices for a hit-test, instead of just the bounding box
  metaio::IGeometry* model = m_metaioSDK->getGeometryFromScreenCoordinates(loc.x * scale, loc.y * scale, true);
	if (model)
	{
    if (model->getAnimationNames().size()>0)
    {
      int index = arc4random()%(model->getAnimationNames().size());
      model->startAnimation(model->getAnimationNames()[index]);
    }
    metaio::EPLAYBACK_STATUS ps = model->getMovieTextureStatus().playbackStatus;
    if (ps == metaio::EPLAYBACK_STATUS_PAUSED || ps == metaio::EPLAYBACK_STATUS_STOPPED)
      model->startMovieTexture();
    else
      model->stopMovieTexture();
	}
}

@end
