//
//  Position.h
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright 2008 Dustin Sallings <dustin@spy.net>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface Position : NSObject {

    SystemSoundID _soundID;
    NSString *_name;

}

+ (id)positionWithName:(NSString *)name;
- (id)initWithName:(NSString *)name;
- (void)play;

- (NSString *)name;

@end
