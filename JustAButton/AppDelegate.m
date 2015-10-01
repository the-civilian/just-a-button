#import "AppDelegate.h"
#import <ARAnalytics.h>
#import <ARDSL.h>
#import "ViewController.h"
#import "Flurry.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

  [ARAnalytics setupWithAnalytics:@{
    ARFlurryAPIKey : @"KEY HERE",
  } configuration:@{
    ARAnalyticsTrackedScreens : @[
      @{
        ARAnalyticsClass : ViewController.class,
        ARAnalyticsDetails : @[
          @{
            ARAnalyticsPageNameKeyPath : @"title",
          },
          @{
            ARAnalyticsEventName : @"button pressed",
            ARAnalyticsSelectorName : ARAnalyticsSelector(buttonPressed:),
          },
        ]
      }
    ]
  }];
#pragma clang diagnostic pop

  [ARAnalytics incrementUserProperty:@"app launched count" byInt:1];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  ViewController *viewController = [[ViewController alloc] init];
  UINavigationController *navigationController = [[UINavigationController alloc]
      initWithRootViewController:viewController];
  self.window.rootViewController = navigationController;

  self.window.backgroundColor = [UIColor whiteColor];

  [self.window makeKeyAndVisible];

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

void uncaughtExceptionHandler(NSException *exception) {
  [Flurry logError:@"Uncaught Exception"
           message:[exception name]
         exception:exception];
}

@end
