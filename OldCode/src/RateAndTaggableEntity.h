//
//  RateAndTaggableEntity.h
//  Musicbrainz
//
//  Created by Jamie McDonald on 10/03/2012.
//  Copyright (c) 2012 Jamie McDonald.
//
//  This program is made available under the terms of the MIT License.
//

#import <Foundation/Foundation.h>

@protocol RateAndTaggableEntity <NSObject>

@property (nonatomic, retain) NSMutableArray *tags;

@end
