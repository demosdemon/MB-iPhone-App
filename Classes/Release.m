//
//  Release.m
//  Musicbrainz
//
//  Created by Jens Lukas on 6/7/10.
//  Copyright 2010 Metabrainz Foundation. All rights reserved.
//
//	Abstract: Release entity

#import "Release.h"


@implementation Release
@synthesize mbid, title, score, artist, date;

-(void) dealloc {
	[mbid release];
	[title release];
	[artist release];
	[date release];
	[super dealloc];
}
@end