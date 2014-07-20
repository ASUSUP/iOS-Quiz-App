//
//  ASUQuizDB.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuizDB.h"
#import "ASUQuiz.h"
#import "ASUQuestion.h"

@interface ASUQuizDB ()

@property (nonatomic) NSMutableArray *privateList;

@end

@implementation ASUQuizDB

+(instancetype) allQuizes {
	static ASUQuizDB* aqd = nil;
	if (!aqd) {
		aqd = [[ASUQuizDB alloc] initPrivate];
		NSArray *answers = [NSArray arrayWithObjects:@"4",@"5",@"1",@"0", nil];
		ASUQuestion *temp1 = [[ASUQuestion alloc] initWithQuestion:@"2+2 = ?" andanswers:answers withRightAnswer:[NSNumber numberWithInt:0]];
		ASUQuestion *temp2 = [[ASUQuestion alloc] initWithQuestion:@"2-2 = ?" andanswers:answers withRightAnswer:[NSNumber numberWithInt:3]];
		ASUQuestion *temp3 = [[ASUQuestion alloc] initWithQuestion:@"2*2 = ?" andanswers:answers withRightAnswer:[NSNumber numberWithInt:0]];
		ASUQuestion *temp4 = [[ASUQuestion alloc] initWithQuestion:@"2/2 = ?" andanswers:answers withRightAnswer:[NSNumber numberWithInt:2]];
		ASUQuiz *theQuiz = [[ASUQuiz alloc] initWithname:@"Math quiz"];
		[theQuiz addQuestion:temp1];
		[theQuiz addQuestion:temp2];
		[theQuiz addQuestion:temp3];
		[theQuiz addQuestion:temp4];
		
		[aqd addQuiz:theQuiz];
	}
	return aqd;
}


-(instancetype) initPrivate {
	self = [super init];
	if (self) {
		self.privateList = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void)addQuiz:(ASUQuiz *)quiz {
	[self.privateList addObject:quiz];
}
-(NSArray *)Quizes {
	return  self.privateList;
}

@end
