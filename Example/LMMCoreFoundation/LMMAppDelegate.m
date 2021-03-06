//
//  LMMAppDelegate.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 02/20/2019.
//  Copyright (c) 2019 马敬龙. All rights reserved.
//

#import "LMMAppDelegate.h"
#import "LMMViewController.h"
#import "LMMCourseViewController.h"
#import <BmobSDK/Bmob.h>
#import "NoticeEntryViewController.h"

@implementation LMMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     [Bmob registerWithAppKey:@"0d3926669974c748d51050c3feffa4f7"];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    LMMViewController * vc = [[LMMViewController alloc] init];
    UINavigationController * naviC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    LMMCourseViewController * vc1 = [[LMMCourseViewController alloc] init];
    UINavigationController * navi1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    UITabBarController * tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[naviC, navi1];
    
    self.window.rootViewController = tabVC;
    
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
