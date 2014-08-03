//
//  ASUGetScoreManager.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUGetScoreManager.h"
#import "ASUCommunicationData.h"
#import "ASUCommunicationDelegate.h"

@implementation ASUGetScoreManager


-(void)getScoreforQuizID:(NSNumber *)quiz_id
	      andanswers:(NSDictionary *)answers{
	NSString *POST_STRING = [NSString stringWithFormat:@"quiz_id=%@&session_id=%@", quiz_id, [ASUCommunicationData getsessionID:@"Get"]];
	for (NSString *key in answers) {
		POST_STRING =[POST_STRING stringByAppendingString:[NSString stringWithFormat:@"&%@&%@", key,[answers valueForKey:key]]];
	}
	NSData *POST_DATA = [POST_STRING dataUsingEncoding:NSASCIIStringEncoding];
	NSString *POST_LENGTH = [NSString stringWithFormat:@"%d", POST_STRING.length];
	
	NSMutableURLRequest *POST_REQUEST  = [[NSMutableURLRequest alloc] init];
	[POST_REQUEST setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/Service/index.php/quiz/answers", [ASUCommunicationData getIP]]]];
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
