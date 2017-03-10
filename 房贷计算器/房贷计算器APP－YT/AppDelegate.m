//
//  AppDelegate.m
//  房贷计算器APP－YT
//
//  Created by 码农教育12 on 16/2/22.
//  Copyright © 2016年 码农教育12. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //友盟
    [MobClick startWithAppkey:@"56d9266567e58e64e2001451" reportPolicy:BATCH   channelId:@""];
    [self CreateTabBarControllerByNav];
    return YES;
}
#pragma mark -
#pragma mark 创建分栏控制器并创建四个分栏对象
-(void) CreateTabBarControllerByNav{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建分栏控制器对象
    UITabBarController *tTabBarController = [[UITabBarController alloc]init];
    //加载4个视图控制器
    CPF_ProvideViewController *CPF_provideVC = [[CPF_ProvideViewController alloc]initWithNibName:@"CPF_ProvideViewController" bundle:[NSBundle mainBundle]];
    Trade_ProvideViewController *Trade_provideVC = [[Trade_ProvideViewController alloc]initWithNibName:@"Trade_ProvideViewController" bundle:[NSBundle mainBundle]];
    Combination_ProvideViewController *Combination_provideVC = [[Combination_ProvideViewController alloc]initWithNibName:@"Combination_ProvideViewController" bundle:[NSBundle mainBundle]];
    Set_ViewController *Set_VC = [[Set_ViewController alloc]initWithNibName:@"Set_ViewController" bundle:[NSBundle mainBundle]];
    //创建4个导航控制器
    UINavigationController *nav1=[[UINavigationController alloc] initWithRootViewController:CPF_provideVC];
    UINavigationController *nav2=[[UINavigationController alloc] initWithRootViewController:Trade_provideVC];
    UINavigationController *nav3=[[UINavigationController alloc] initWithRootViewController:Combination_provideVC];
    UINavigationController *nav4=[[UINavigationController alloc] initWithRootViewController:Set_VC];
    //创建选项卡
    UITabBarItem *firstItem=[[UITabBarItem alloc] initWithTitle:@"公积金贷款" image:[UIImage imageNamed:@"loan_Img_nomal"] selectedImage:[UIImage imageNamed:@"Loan_Img"]];
    UITabBarItem *secondItem=[[UITabBarItem alloc] initWithTitle:@"商业贷款" image:[UIImage imageNamed:@"loan_Img_nomal"] selectedImage:[UIImage imageNamed:@"Loan_Img"]];
    UITabBarItem *thirdItem=[[UITabBarItem alloc] initWithTitle:@"组合贷款" image:[UIImage imageNamed:@"loan_Img_nomal"] selectedImage:[UIImage imageNamed:@"Loan_Img"]];
    UITabBarItem *fourItem=[[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"Install"] selectedImage:[UIImage imageNamed:@"Install"]];
    nav1.tabBarItem=firstItem;
    nav2.tabBarItem=secondItem;
    nav3.tabBarItem=thirdItem;
    nav4.tabBarItem=fourItem;
    tTabBarController.viewControllers=@[nav1,nav2,nav3,nav4];
    self.window.rootViewController=tTabBarController;
}
#pragma mark -
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
