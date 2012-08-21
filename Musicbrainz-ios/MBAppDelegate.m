//
//  MBAppDelegate.m
//  Musicbrainz-ios
//
//  Created by Joachim LeBlanc on 8/8/12.
//  Copyright (c) 2012 Joachim LeBlanc. All rights reserved.
//

#import "MBAppDelegate.h"

#ifdef DISTRIBUTION
#define MB_CLIENT_NAME @"mbios-" VERSION
#define MB_SERVER_NAME @"musicbrainz.org"
#define MB_SERVER_PORT @80
#else
#define MB_CLIENT_NAME @"mbios-test"
#define MB_SERVER_NAME @"test.musicbrainz.org"
#define MB_SERVER_PORT @80
#endif

#define _TTNavigator()	([TTNavigator navigator])
#define _TTURLMap()			(_TTNavigator().URLMap)

@implementation MBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:TTScreenBounds()];
	TTDASSERT(self.window != nil);
	TTDASSERT(_TTNavigator() != nil);

	self.mbConnection = [MBConnection connectionWithClientName:MB_CLIENT_NAME server:MB_SERVER_NAME port:MB_SERVER_PORT];

	_TTNavigator().persistenceMode = TTNavigatorPersistenceModeAll;
	_TTNavigator().window = self.window;
	
	[_TTURLMap() from:@"*" toViewController:[TTWebController class]];
  [_TTURLMap() from:@"musicbrainz://search" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://search/(initWithEntityType:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://search/(initWithEntityType:)/(query:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://search/(initWithEntityType:)/(query:)/(page:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://scan" toViewController:nil];
  [_TTURLMap() from:@"musicbrainz://collections" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://collections/(initWithCollectionId:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://collections/()/#add/(addRelease:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://collections/()/#del/(delRelease:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://(initWithEntityType:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://(initWithEntityType:)/(id:)" toViewController:nil];
	[_TTURLMap() from:@"musicbrainz://(initWithEntityType:)/(id:)" toViewController:nil];

	if (![_TTNavigator() restoreViewControllers]) {
    // This is the first launch, so we just start with the tab bar
    [_TTNavigator() openURLAction:[TTURLAction actionWithURLPath:@"http://musicbrainz.org/"]];
  }

	return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	[[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:url.absoluteString]];
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
