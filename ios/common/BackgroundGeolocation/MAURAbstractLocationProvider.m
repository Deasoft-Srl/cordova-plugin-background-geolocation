//
//  MAURAbstractLocationProvider.m
//  BackgroundGeolocation
//
//  Created by Marian Hello on 14/09/2016.
//  Forked by mauron85.
//  Copyright © 2020 progamma. All rights reserved.
//

#import "MAURAbstractLocationProvider.h"

@implementation MAURAbstractLocationProvider {
    UILocalNotification *localNotification;
}

@synthesize delegate;

- (instancetype) init
{
    if( [self class] == [MAURAbstractLocationProvider class])
    {
        NSAssert(false, @"You cannot init this class directly. Instead, use a subclass e.g. DistanceFilterLocationProvider.h");
        return nil;
    }
    
    self = [super init];
    if (self == nil) {
        return self;
    }
    
    localNotification = [[UILocalNotification alloc] init];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    return self;
}

- (void) notify:(NSString*)message
{
    localNotification.fireDate = [NSDate date];
    localNotification.alertBody = message;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void) onTerminate
{
    // override in sub class
}

- (void) onSwitchMode:(MAUROperationalMode)mode
{
    // override in sub class
}

@end
