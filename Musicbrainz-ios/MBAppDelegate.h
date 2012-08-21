//
//  MBAppDelegate.h
//  Musicbrainz-ios
//
//  Created by Joachim LeBlanc on 8/8/12.
//  Copyright (c) 2012 Joachim LeBlanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MBConnection *mbConnection;

@end
