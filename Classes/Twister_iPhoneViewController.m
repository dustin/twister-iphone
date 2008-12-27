//
//  Twister_iPhoneViewController.m
//  Twister-iPhone
//
//  Created by Dustin Sallings on 2008/12/26.
//  Copyright Dustin Sallings <dustin@spy.net> 2008. All rights reserved.
//

#import "AudioToolbox/AudioServices.h"

#import "Twister_iPhoneViewController.h"
#import "NSArray+RandomChoice.h"
#import "Position.h"

@implementation Twister_iPhoneViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)newCall:(id) sender {
    Position *limb=[limbs choice];
    Position *color=[colors choice];

    NSLog(@"Limb:  %@", limb);
    NSLog(@"Color:  %@", color);

    [theLabel setText:[NSString stringWithFormat:@"%@ %@", limb, color]];
    [limb play];
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:color selector:@selector(play) userInfo:nil repeats:NO];

    /*
    [synth stopSpeaking];
    [synth startSpeakingString:[NSString stringWithFormat:@"%@ %@", limb, color]];  
    
    [self setAnImage:leftPane to:limb];
    [self setAnImage:rightPane to:color];
    */
}

- (NSArray *)loadPositions:(NSArray *)positionNames {
    NSMutableArray *rv=[[NSMutableArray alloc] init];
    id object;
    NSEnumerator *e=[positionNames objectEnumerator];
    while(object = [e nextObject]) {
        [rv addObject:[Position positionWithName:object]];
    }
    return [rv autorelease];
}

- (void)awakeFromNib {
    NSArray *limbs_names = [NSArray arrayWithObjects: @"left foot", @"right foot", @"left hand", @"right hand", nil];
    NSArray *colors_names = [NSArray arrayWithObjects: @"blue", @"green", @"red", @"yellow", nil];

    limbs = [[self loadPositions:limbs_names] retain];
    colors = [[self loadPositions:colors_names] retain];

    NSLog(@"Limbs:  %@", limbs);
    NSLog(@"Colors:  %@", colors);

    timer = [NSTimer scheduledTimerWithTimeInterval:6.0
                                             target:self
                                           selector:@selector(newCall:)
                                           userInfo:nil
                                            repeats:YES];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
