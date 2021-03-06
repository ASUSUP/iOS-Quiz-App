//
//  ASUGetQuizManager.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUGetQuizManager.h"
#import "ASUCommunicationData.h"
#import "ASUCommunicationDelegate.h"

@implementation ASUGetQuizManager


-(void)GetQuizes:(NSNumber *)forCourseID {
	NSString *URL_STRING = [NSString stringWithFormat:@"http://%@/Service/index.php/courses/quizzes?id=%@&session_id=%@", [ASUCommunicationData getIP], forCourseID, [ASUCommunicationData getsessionID:@"GET"]];
	NSURL *URL = [NSURL URLWithString:URL_STRING];
	NSLog(@"URL: %@", URL_STRING);
	
	[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:URL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
		if (error) {
			[self.delegate fetchingGroupsFailedWithError:error];
		} else {
			[self.delegate receivedDataJSON:data];
		}
		
	}];
}

@end
