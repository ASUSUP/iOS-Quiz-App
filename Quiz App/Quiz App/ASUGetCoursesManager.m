//
//  ASUGetCoursesManager.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUGetCoursesManager.h"
#import "ASUCommunicationDelegate.h"
#import "ASUCommunicationData.h"

@implementation ASUGetCoursesManager

-(void)getCourses {
	NSString *URL_STRING = [NSString stringWithFormat:@"http://%@/Service/index.php/courses?session_id=%@", [ASUCommunicationData getIP], [ASUCommunicationData getsessionID:@"GET"]];
	NSURL *URL = [NSURL URLWithString:URL_STRING];
	
	[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:URL] queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
		if (error) {
			[self.delegate fetchingGroupsFailedWithError:error];
		} else {
			[self.delegate receivedDataJSON:data];
		}
		
	}];
	
}

@end
