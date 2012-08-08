//
//  MBMasterViewController.h
//  Musicbrainz-ios
//
//  Created by Joachim LeBlanc on 8/8/12.
//  Copyright (c) 2012 Joachim LeBlanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBDetailViewController;

@interface MBMasterViewController : UITableViewController

@property (strong, nonatomic) MBDetailViewController *detailViewController;

@end
