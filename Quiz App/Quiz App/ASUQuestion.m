//
//  ASUQuestion.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuestion.h"

@implementation ASUQuestion


-(instancetype)initWithQuestion:(NSString *)ques
		     andanswers:(NSArray *)ans
		withRightAnswer:(NSNumber *)index {
	self = [super init];
	if (self) {
		question = ques;
		answers = ans;
		indexOfCorrectAnswer = index;
	}
	return self;
}

-(NSString *)question {
	return  question;
}

-(NSArray *)answers {
	return  answers;
}
-(NSNumber *)indexOfCorrectAnswer {
	return indexOfCorrectAnswer;
}

-(BOOL)isCorrectAnswerAtIndex:(NSNumber *)index {
	if ([index isEqualToNumber:indexOfCorrectAnswer]) {
		return YES;
	}
	return NO;
}

@end
