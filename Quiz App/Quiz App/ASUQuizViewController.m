//
//  ASUQuizViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuizViewController.h"
#import "ASUCommunicationDelegate.h"
#import "ASUGetQuestionsManager.h"
#import "ASUStudent.h"
#import "ASUQuestion.h"
#import "ASUQuiz.h"

@interface ASUQuizViewController () <ASUCommunicationDelegate> {
	NSMutableArray *_questions;
	NSMutableDictionary *_answers;
}

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

-(instancetype) initWithQuizes:(NSNumber *)QuizID :(NSString *) Quizname {
	self = [super init];
	if (self) {
		quiz_ID = QuizID;
		index = -1;
		self.navigationItem.title = @"loading";
		self.navigationItem.hidesBackButton=YES;
		ASUGetQuestionsManager *manager = [[ASUGetQuestionsManager alloc] init];
		manager.delegate = self;
		[manager getQuestions:QuizID];
	}
	self.navigationItem.title = Quizname;
	return self;
}


-(void)receivedDataJSON:(NSData *)objectNotation {
	NSError *error = nil;
	NSArray *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&error];
	NSLog(@"parsed Questions: %@", parsedObject);
	
	for (NSDictionary *Questions in parsedObject) {
		NSString *Question_name = (NSString *)[Questions valueForKey:@"question_string"];
		NSNumber *Question_id = (NSNumber *) [Question_name valueForKey:@"question_id"];
		_answers[Question_id] = [NSNumber numberWithInt:-1];
		NSMutableArray *choices_string = [[NSMutableArray alloc] init];
		NSMutableArray *choices_id = [[NSMutableArray alloc] init];
		NSArray *choices = (NSArray *)[Questions valueForKey:@"choices"];
		for (NSDictionary *choicesdic in choices) {
			NSString *choice_string = (NSString *)[choicesdic valueForKey:@"choice_string"];
			NSNumber *choice_id = (NSNumber *) [choicesdic valueForKey:@"id"];
			[choices_string addObject:choice_string];
			[choices_id addObject:choice_id];
		}
		ASUQuestion *newQuestion = [[ASUQuestion alloc] initWithQuestion:Question_name questionID:Question_id andanswers:choices_string answers_id:choices_id];
		[_questions addObject:newQuestion];
	}
}

-(void)fetchingGroupsFailedWithError:(NSError *)error{
	
}

-(void) viewDidLoad{
	[super viewDidLoad];
	[self loadData];
	
}

-(void)loadData{
	index++;
	if (index>=[_questions count]) {
		
		
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
	currentQuestion = [_questions objectAtIndex:index];
	self.QuestionLabel.text= [currentQuestion question];
	self.AnswerALabel.text = [[currentQuestion answers] objectAtIndex:0];
	self.AnswerBLabel.text = [[currentQuestion answers] objectAtIndex:1];
	self.AnswerCLabel.text = [[currentQuestion answers] objectAtIndex:2];
	self.AnswerDLabel.text = [[currentQuestion answers] objectAtIndex:3];
}
- (IBAction)SubmitA:(id)sender {
	[_answers setObject:[NSNumber numberWithInt:0] forKey:currentQuestion.question_id ];
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitB:(id)sender {
	[_answers setObject:[NSNumber numberWithInt:1] forKey:currentQuestion.question_id ];
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitC:(id)sender {
	[_answers setObject:[NSNumber numberWithInt:2] forKey:currentQuestion.question_id ];
	[self loadData];
	NSLog(@"%d",score);
}

- (IBAction)SubmitD:(id)sender {
	[_answers setObject:[NSNumber numberWithInt:3] forKey:currentQuestion.question_id ];
	[self loadData];
	NSLog(@"%d",score);
}
@end
