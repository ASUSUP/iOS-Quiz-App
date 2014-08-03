//
//  ASULoginManager.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/2/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASULoginManager.h"
#import "ASUCommunicationData.h"

@implementation ASULoginManager

-(void) checkUsernameAndPassword:(NSString *)username
				:(NSString *) password {
	NSString *POST_STRING = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
	NSData *POST_DATA = [POST_STRING dataUsingEncoding:NSASCIIStringEncoding];
	NSString *POST_LENGTH = [NSString stringWithFormat:@"%d", POST_STRING.length];
	
	NSMutableURLRequest *POST_REQUEST  = [[NSMutableURLRequest alloc] init];
	[POST_REQUEST setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/Service/index.php/login", [ASUCommunicationData getIP]]]];
	[POST_REQUEST setHTTPMethod:@"POST"];
	[POST_REQUEST setValue:POST_LENGTH forHTTPHeaderField:@"Content-Length"];
	[POST_REQUEST setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[POST_REQUEST setHTTPBody:POST_DATA];
	
	[NSURLConnection sendAsynchronousRequest:POST_REQUEST queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
		if (error) {
			[self.delegate fetchingGroupsFailedWithError:error];
		} else {
			[self.delegate receivedDataJSON:data];
		}

	}];
	
}

@end
