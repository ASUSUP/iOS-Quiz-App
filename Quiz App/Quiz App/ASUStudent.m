//
//  ASUStudent.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUStudent.h"

@implementation ASUStudent


-(instancetype) initWithUserName:(NSString *)name
		     andPassword:(NSString *)pass {
	self = [super init];
	if (self) {
		userName = name;
		password = pass;
		Quizes = [NSMutableDictionary dictionary];
	}
	return self;
}

-(void)tookQuizWithName:(NSString *) quizname
	       andScore:(NSNumber *)score {
	Quizes[quizname]=score;
}

-(BOOL)userHasUsername:(NSString *)name
	   andPassword:(NSString *)pass {
	if ([userName isEqualToString:name] && [password isEqualToString:pass]) {
		return YES;
	}
	return  NO;
}
-(NSNumber *)hasTookthisQuizBefore:(NSString *)name {
	if (Quizes[name]) {
		return Quizes[name];
	}
	return [NSNumber numberWithInt:-1];
}
-(NSString *)description {
	return [NSString stringWithFormat:@"%@ %@", userName, password];
}


@end
