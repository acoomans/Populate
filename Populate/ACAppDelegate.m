//
//  ACAppDelegate.m
//  Populate
//
//  Created by Arnaud Coomans on 27/01/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import "ACAppDelegate.h"

#import "PopulateKit.h"

@implementation ACAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    /*
    ACPerson *personA = [[ACPerson alloc] initWithFirstname:@"Alice"
                                                   lastName:@"A"
                                                      email:@"alice@example.com"
                                                      phone:@"555-111-1111"
                                                      image:nil];
    ACPerson *personB = [[ACPerson alloc] initWithFirstname:@"Bob"
                                                   lastName:@"B"
                                                      email:@"bob@example.com"
                                                      phone:@"555-222-2222"
                                                      image:nil];
    ACPerson *personC = [[ACPerson alloc] initWithFirstname:@"Charlie"
                                                   lastName:@"C"
                                                      email:@"charles@example.com"
                                                      phone:@"555-333-3333"
                                                      image:nil];
    
    
    [ACPopulate populateGroupWithName:@"Test" withPersons:@[personA, personB, personC] completion:nil];
    
    [ACPopulate depopulateGroupWithName:@"Test" completion:nil];
    
    [ACPopulate populateGroupWithName:@"Test" withCountOfPersons:10 fromSet:[ACPersonSet personSetWithRandomNameAndImage] completion:nil];
    */
    
    
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
