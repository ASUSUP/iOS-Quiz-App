//
//  ASUQuiz.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASUQuestion;

@interface ASUQuiz : NSObject
{
	NSString *quizName;
	NSMutableArray *Questions;
}

-(instancetype) initWithname:(NSString *)name;

-(void) addQuestion:(ASUQuestion *) ques;

-(NSMutableArray *)Questions;

-(NSString *)quizName;

@end
