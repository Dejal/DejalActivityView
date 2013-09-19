//
//  AppDelegate.m
//  DejalActivityView Demo
//
//  Created by David Sinclair on 2009-07-29.
//  Copyright Dejal Systems, LLC 2009-2013. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "DejalActivityView.h"


@implementation AppDelegate

@synthesize window, navigationController, defaultImageView;


- (void)applicationDidFinishLaunching:(UIApplication *)application; {
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
    // No need for a property for the activity view:
    [DejalBezelActivityView activityViewForView:window];
    
    // Normally you'd do other work to load the data etc, then remove the activity view; faking that delay here:
    [self performSelector:@selector(removeActivity) withObject:nil afterDelay:2.0];
}

- (void)removeActivity;
{
    // Easily remove the activity view:
    [DejalBezelActivityView removeViewAnimated:YES];
}


- (void)applicationWillTerminate:(UIApplication *)application;
{
	// Save data if appropriate
}

@end

