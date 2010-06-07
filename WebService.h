//
//  WebService.h
//  Musicbrainz
//
//  Created by Jens Lukas on 6/4/10.
//  Copyright 2010 Metabrainz Foundation. All rights reserved.
//
// Abstract: Responsible for retrieving data from a given URL

#import <Foundation/Foundation.h>

// Delegate
@protocol RequestCompleteDelegate
-(void)finishedDownload;
@end

// common class definition
@interface WebService : NSObject {
	@private
	NSURLConnection *serviceConnection;
	NSMutableData *xmlData;
	id <RequestCompleteDelegate> delegate;
}
@property (nonatomic, retain) NSMutableData *xmlData;
@property (nonatomic, retain) id <RequestCompleteDelegate> delegate;

-(void)getData:(NSURL *)url;
@end
