//
//  Twister_iPhoneAppDelegate.m
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright Dustin Sallings <dustin@spy.net> 2008. All rights reserved.
//

#import "Twister_iPhoneAppDelegate.h"
#import "Twister_iPhoneViewController.h"

@implementation Twister_iPhoneAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
