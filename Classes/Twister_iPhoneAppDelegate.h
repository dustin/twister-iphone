//
//  Twister_iPhoneAppDelegate.h
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright Dustin Sallings <dustin@spy.net> 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Twister_iPhoneViewController;

@interface Twister_iPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Twister_iPhoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Twister_iPhoneViewController *viewController;

@end

