//
//  AppDelegate.m
//
// Copyright 2007-2013 metaio GmbH. All rights reserved.
//

#import "AppDelegate.h"
//#import "ARELViewController.h"
//#import "Template.h"

// With this macro you can decide whether you want to use the native or AREL-based template view
// controller (implemented in Template.mm or ARELViewController.mm, respectively)
#define NATIVE

@interface AppDelegate ()

-(UISplitViewController*) splitViewController;

@end

@implementation AppDelegate
/*
- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}
*/

-(UISplitViewController*) splitViewController
{
  UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
  for (id object in tabBarController.viewControllers) {
    if ([object isKindOfClass:[UISplitViewController class]])
      return object;
  }
  [NSException raise:@"No UISplitViewController found" format:@"No UISplitViewController found"];
  return nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    
    UISplitViewController *splitViewController = [self splitViewController];
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    splitViewController.delegate = (id)navigationController.topViewController;
  }
  return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
