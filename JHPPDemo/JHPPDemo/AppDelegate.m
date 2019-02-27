//
//  AppDelegate.m
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "AppDelegate.h"
#import "JHPPVC1.h"
#import "JHPPVC2.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupRootController];
    return YES;
}

- (void)setupRootController
{
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[[JHPPVC1 alloc] init]];
    nav1.tabBarItem.title = @"Item 1";
    
    JHPPVC2 *vc2 = [[JHPPVC2 alloc] init];
    vc2.tabBarItem.title = @"Item 2";
    
    [tabVC addChildViewController:nav1];
    [tabVC addChildViewController:vc2];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
}



@end
