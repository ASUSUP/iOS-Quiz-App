//
//  ASUCommunicationData.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/2/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUCommunicationData.h"

@implementation ASUCommunicationData

+(NSString *)getIP{
	return @"197.39.242.151";
}
+(NSString *)getsessionID:(NSString *)temp{
	static NSString *session_id = nil;
	if ([temp isEqualToString:@"GET"]) {
		return session_id;
	} else {
		session_id = temp;
		return session_id;
	}
}


@end
