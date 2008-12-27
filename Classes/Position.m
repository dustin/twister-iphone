//
//  Position.m
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright 2008 Dustin Sallings <dustin@spy.net>. All rights reserved.
//

#import "Position.h"


@implementation Position

+ (id)positionWithName:(NSString *)name {
    if (name) {
        return [[[Position alloc] initWithName:name] autorelease];
    }
    return nil;
}

- (id)initWithName:(NSString *)name {
    self = [super init];

    _name=[name retain];

    NSString *path=[[NSBundle mainBundle] pathForResource:name ofType:@"aif"];
    
    if (self != nil) {
        NSURL *aFileURL = [NSURL fileURLWithPath:path isDirectory:NO];
        
        if (aFileURL != nil)  {
            SystemSoundID aSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef)aFileURL, &aSoundID);
            
            if (error == kAudioServicesNoError) { // success
                _soundID = aSoundID;
            } else {
                NSLog(@"Error %d loading sound at path: %@", error, path);
                [self release], self = nil;
            }
        } else {
            NSLog(@"NSURL is nil for path: %@", path);
            [self release], self = nil;
        }
    }
    return self;
}

- (void)description {
    [self name];
}

-(void)dealloc {
    AudioServicesDisposeSystemSoundID(_soundID);
    [super dealloc];
}

-(void)play {
    AudioServicesPlaySystemSound(_soundID);
}

- (NSString *)name {
    return [[_name retain] autorelease];
}

@end
