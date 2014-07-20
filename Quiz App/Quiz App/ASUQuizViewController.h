//
//  ASUQuizViewController.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASUStudent;
@class ASUQuiz;
@class ASUQuestion;

@interface ASUQuizViewController : UIViewController
{
	ASUStudent *currentStudent;
	int score;
	ASUQuiz *currentQuiz;
	ASUQuestion *currentQuestion;
	unsigned int index;
}

-(instancetype) initWithStudent:(ASUStudent *)student
		     takingQuiz:(ASUQuiz *)quiz;

-(void) loadData;
@end
