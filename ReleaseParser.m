//
//  ReleaseParser.m
//  Musicbrainz
//
//  Created by Jens Lukas on 6/5/10.
//  Copyright 2010 Metabrainz Foundation. All rights reserved.
//
// Abstract: Concrete implementation of the XML parser for releases


#import "ReleaseParser.h"


@implementation ReleaseParser
@synthesize currentRelease;

// Constants for the XML element names used while parsing
static NSString *RELEASELIST = @"release-list";
static NSString *RELEASE = @"release";
static NSString *TITLE = @"title";
static NSString *ARTIST = @"name";

-(void) parse:(NSData *) data {
	xmlData = data;
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
	currentString = [NSMutableString string];
	
	[parser parse];
	
	[parser release];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *) qualifiedName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:RELEASELIST]) {
		// init results array
		results = [NSMutableArray array];
	} else if([elementName isEqualToString:RELEASE]) {
		Release *release = [[Release alloc] init];
		release.mbid = [attributeDict valueForKey:@"id"];

		self.currentRelease = release;
		[release release];
		
		//currentRelease.score = [attributeDict valueForKey:@"ext:score"];
	} else if([elementName isEqualToString:TITLE]||[elementName isEqualToString:ARTIST]) {
		[currentString setString:@""];
		storingCharacters = YES;
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:RELEASELIST]) {
		[super finished];
	} else if ([elementName isEqualToString:RELEASE]) {
		[results addObject:self.currentRelease];
	} else if ([elementName isEqualToString:TITLE]) {
		self.currentRelease.title = [NSString stringWithString:self.currentString];
	} else if ([elementName isEqualToString:ARTIST]) {
		self.currentRelease.artist = [NSString stringWithString:self.currentString];
	}
    storingCharacters = NO;
}

-(void) dealloc {
	currentRelease = nil;
	[currentRelease release];
	[super dealloc];
}

@end
