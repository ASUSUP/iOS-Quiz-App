//
//  ASUScoreViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUScoreViewController.h"

@interface ASUScoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (nonatomic, weak) NSNumber *lastScore;
@property (nonatomic, weak) NSNumber *total;
@property (nonatomic, weak) NSString *name;
@end

@implementation ASUScoreViewController

-(instancetype) initWithScore:(NSNumber *)lastScore
			 from:(NSNumber *)total
		  forQuizName:(NSString *)name{
	self = [super init];
	if (self) {
		self.lastScore =lastScore;
		self.total = total;
		self.name =name;
	}
	return self;
}

-(void)viewDidLoad {
	self.Score.text = [NSString stringWithFormat:@"Your last score is %@/%@", self.lastScore,self.total];
	self.navigationItem.title=self.name;
}


@end
