//
//  ASUQuiz.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuiz.h"



@implementation ASUQuiz


-(instancetype) initWithname:(NSString *)name {
	self = [super init];
	if (self) {
		quizName = name;
		Questions = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) addQuestion:(ASUQuestion *) ques {
	[Questions addObject:ques];
}

-(NSMutableArray *)Questions {
	return Questions;
}
-(NSString *)quizName{
	return quizName;
}

-(NSString *)description {
	return quizName;
}

@end
