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
	NSArray *answers;
	NSNumber *indexOfCorrectAnswer;
}

-(instancetype)initWithQuestion:(NSString *)ques
		     andanswers:(NSArray *)ans
		withRightAnswer:(NSNumber *)index;


-(NSString *)question;
-(NSArray *)answers;
-(NSNumber *)indexOfCorrectAnswer;

-(BOOL)isCorrectAnswerAtIndex:(NSNumber *)index;


@end
