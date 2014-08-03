//
//  ASUQuestion.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASUQuestion : NSObject
{
	NSString *question;
	NSNumber *question_id;
	NSArray *answers;
	NSArray *answers_id;
	NSNumber *indexOfCorrectAnswer;
}

-(instancetype)initWithQuestion:(NSString *)ques
		     questionID:(NSNumber *)que_id
		     andanswers:(NSArray *)ans
		     answers_id:(NSArray *)ans_id;

-(NSString *)question;
-(NSNumber *)question_id;
-(NSArray *)answers;
-(NSNumber *)indexOfCorrectAnswer;
-(NSArray *)answers_id;

-(BOOL)isCorrectAnswerAtIndex:(NSNumber *)index;


@end
