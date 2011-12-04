//
//  AppDelegate.m
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Private)
- (void)startLocationManager;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize currentLocation = _currentLocation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self startLocationManager];
    
    //Appearence
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.2471 green:0.1137 blue:0.1294 alpha:1.0000]];
    
    //[[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.2471 green:0.1137 blue:0.1294 alpha:1.0000]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbarbg"]]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    [locationManager stopUpdatingLocation];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    [locationManager startUpdatingLocation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)startLocationManager {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 10; //(1609.344 * .25); //meters * miles
    [locationManager startUpdatingLocation];
}

- (void)setCurrentLocation:(CLLocationCoordinate2D)currentLocation {
    _currentLocation = currentLocation;
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"LocationUpdated" object:self]];
}

#pragma mark - 
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation {
    
    
    self.currentLocation = newLocation.coordinate;
    NSLog(@"Updated: %g, %g", self.currentLocation.longitude, self.currentLocation.latitude);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if (error.code == kCLErrorDenied || error.code == kCLErrorNetwork) {
        [manager stopUpdatingLocation];
        self.currentLocation = CLLocationCoordinate2DMake(47.620975, -122.244186);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Location Services", nil) 
                                                        message:NSLocalizedString(@"We are unable to determine your location, please enable Location Services.", nil)
                                                       delegate:nil cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

@end
