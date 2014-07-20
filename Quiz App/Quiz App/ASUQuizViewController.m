//
//  ASUQuizViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuizViewController.h"
#import "ASUStudent.h"
#import "ASUQuestion.h"
#import "ASUQuiz.h"

@interface ASUQuizViewController ()
@property (weak, nonatomic) IBOutlet UILabel *QuestionLabel;
@property (weak, nonatomic) IBOutlet UILabel *AnswerALabel;
@property (weak, nonatomic) IBOutlet UILabel *AnswerBLabel;
@property (weak, nonatomic) IBOutlet UILabel *AnswerCLabel;
@property (weak, nonatomic) IBOutlet UILabel *AnswerDLabel;
@property (weak, nonatomic) IBOutlet UIButton *Asub;
@property (weak, nonatomic) IBOutlet UIButton *Bsub;
@property (weak, nonatomic) IBOutlet UIButton *Csub;
@property (weak, nonatomic) IBOutlet UIButton *Dsub;

@end

@implementation ASUQuizViewController

-(instancetype) initWithStudent:(ASUStudent *)student
		     takingQuiz:(ASUQuiz *)quiz {
	self = [super init];
	if (self) {
		currentQuiz =quiz;
		currentStudent = student;
		index = -1;
		score =0;
		self.navigationItem.title = currentQuiz.quizName;
		self.navigationItem.hidesBackButton=YES;
	}
	return self;
}

-(void) viewDidLoad{
	[super viewDidLoad];
	[self loadData];
	
}

-(void)loadData{
	index++;
	if (index>=[[currentQuiz Questions] count]) {
		self.QuestionLabel.text = [NSString stringWithFormat:@"Your score is %d/%d"
					    ,score,[[currentQuiz Questions] count]];
		self.AnswerALabel.hidden=YES;
		self.AnswerBLabel.hidden=YES;
		self.AnswerCLabel.hidden=YES;
		self.AnswerDLabel.hidden=YES;
		
		self.Asub.hidden = YES;
		self.Bsub.hidden = YES;
		self.Csub.hidden = YES;
		self.Dsub.hidden = YES;
		
		self.navigationItem.hidesBackButton=NO;
		[currentStudent tookQuizWithName:currentQuiz.quizName andScore:[NSNumber numberWithInt:score]];
		return;
	}
	currentQuestion = [[currentQuiz Questions] objectAtIndex:index];
	self.QuestionLabel.text= [currentQuestion question];
	self.AnswerALabel.text = [[currentQuestion answers] objectAtIndex:0];
	self.AnswerBLabel.text = [[currentQuestion answers] objectAtIndex:1];
	self.AnswerCLabel.text = [[currentQuestion answers] objectAtIndex:2];
	self.AnswerDLabel.text = [[currentQuestion answers] objectAtIndex:3];
}
- (IBAction)SubmitA:(id)sender {
	if ([currentQuestion.indexOfCorrectAnswer isEqualToNumber:[NSNumber numberWithInt:0]]) {
		score++;
	}
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitB:(id)sender {
	if ([currentQuestion.indexOfCorrectAnswer isEqualToNumber:[NSNumber numberWithInt:1]]) {
		score++;
	}
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitC:(id)sender {
	if ([currentQuestion.indexOfCorrectAnswer isEqualToNumber:[NSNumber numberWithInt:2]]) {
		score++;
	}
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitD:(id)sender {
	if ([currentQuestion.indexOfCorrectAnswer isEqualToNumber:[NSNumber numberWithInt:3]]) {
		score++;
	}
	[self loadData];
	NSLog(@"%d",score);
}
@end
