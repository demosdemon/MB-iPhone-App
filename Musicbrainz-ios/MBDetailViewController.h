//
//  MBDetailViewController.h
//  Musicbrainz-ios
//
//  Created by Joachim LeBlanc on 8/8/12.
//  Copyright (c) 2012 Joachim LeBlanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
