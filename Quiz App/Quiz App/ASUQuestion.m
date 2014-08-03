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
		     questionID:(NSNumber *)ques_id
		     andanswers:(NSArray *)ans
		     answers_id:(NSArray *)ans_id{
	self = [super init];
	if (self) {
		question = ques;
		question_id = ques_id;
		answers = ans;
		answers_id  = ans_id;
	}
	return self;
}

-(NSString *)question {
	return  question;
}
-(NSNumber *)question_id {
	return  question_id;
}

-(NSArray *)answers {
	return  answers;
}
-(NSArray *)answers_id{
	return answers_id;
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
