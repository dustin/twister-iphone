//
//  Twister_iPhoneViewController.h
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright Dustin Sallings <dustin@spy.net> 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Twister_iPhoneViewController : UIViewController {

    IBOutlet id theLabel;

    NSTimer *timer;
    NSArray *limbs;
    NSArray *colors;

}

@end

