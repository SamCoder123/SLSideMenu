//
//  AppDelegate.m
//  SLSideMenu
//
//  Created by halong33 on 16/3/16.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import "AppDelegate.h"
#import "MainVC.h"
#import "SideMenuVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:[MainVC controller]];
    SideMenuVC *sideVC = [SideMenuVC controller];
    _slSideMenuVC = [[SLSideMenuVC alloc] initWithMainVC:navVC sideMenuVC:sideVC];
    self.window.rootViewController  = _slSideMenuVC;
    self.window.backgroundColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
