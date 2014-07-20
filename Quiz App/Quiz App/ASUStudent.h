//
//  ASUStudent.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASUStudent : NSObject
{
	NSString *userName;
	NSString *password;
	NSMutableDictionary *Quizes;
}

-(instancetype) initWithUserName:(NSString *)name
		     andPassword:(NSString *)pass;

-(void)tookQuizWithName:(NSString *) quizname
	       andScore:(NSNumber *)score;

-(BOOL)userHasUsername:(NSString *)name
	   andPassword:(NSString *)pass;

-(NSNumber *)hasTookthisQuizBefore:(NSString *)name;

@end
