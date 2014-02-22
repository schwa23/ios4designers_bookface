//
//  AppDelegate.m
//  bookface
//
//  Created by Joshua Dickens on 2/11/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsPostViewController.h"
#import "FeedViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSArray *tabs = @[@{@"name": @"News Feed", @"image": @"feed_tab_img"},
                      @{@"name" : @"Requests", @"image": @"requests_tab_img"},
                      @{@"name" : @"Messages", @"image": @"messages_tab_img"},
                      @{@"name" : @"Notifications", @"image": @"notifications_tab_img"},
                      @{@"name" : @"More", @"image": @"more_tab_img"}];
    
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    for (int i=0; i<tabs.count; i++) {
        //do stuff
        NSString *tabName = tabs[i][@"name"];
        UINavigationController *nvc = [[UINavigationController alloc] init];
        
        
        
        nvc.navigationBar.barTintColor = [UIColor
                                                    colorWithRed:68.0/255.0
                                                    green: 99.0/255.0
                                                    blue: 161.0/255.0
                                                    alpha:1.0];
        nvc.navigationBar.tintColor = [UIColor whiteColor];
        nvc.navigationBar.translucent = NO;
        nvc.navigationBar.titleTextAttributes = [[NSDictionary alloc] initWithObjects:@[[UIColor whiteColor]] forKeys:@[NSForegroundColorAttributeName]];
        
        [nvc.tabBarItem setTitle:tabName];
        [nvc.tabBarItem setImage:[UIImage imageNamed:tabs[i][@"image"]]];
        
        if([tabName  isEqual: @"Notifications"]) {
            FeedViewController *feedView = [[FeedViewController alloc] init];

            feedView.title = @"";
            [nvc setViewControllers:@[feedView] animated:NO];
            
        } else {
        
            UILabel *placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,100,300,40)];
            placeholderLabel.text =tabs[i][@"name"];
            [nvc.view addSubview:placeholderLabel];
        }
        [vcs addObject:nvc];
        
        
    }

    

    
    
    
    //add our notifications tab at index 3 [akak tab 4]
    

    
    UITabBarController *tabBarController =[[UITabBarController alloc] init];
    
    [tabBarController setViewControllers:vcs];
    [tabBarController setSelectedIndex:3];
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
