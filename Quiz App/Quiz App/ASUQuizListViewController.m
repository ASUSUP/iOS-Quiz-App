//
//  ASUQuizListViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUQuizListViewController.h"
#import "ASUQuizViewController.h"
#import "ASUScoreViewController.h"
#import "ASUQuizDB.h"
#import "ASUStudent.h"
#import "ASUQuiz.h"

@implementation ASUQuizListViewController


- (instancetype)init{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
		UINavigationItem *nvitem = self.navigationItem;
		nvitem.title = @"Quizes";
		nvitem.hidesBackButton= YES;
	}
	return self;
}
-(instancetype) initWithStyle:(UITableViewStyle)style{
	return [self init];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self.tableView registerClass:[UITableViewCell class]
	       forCellReuseIdentifier:@"UITableViewCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[ASUQuizDB allQuizes] Quizes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"forIndexPath:indexPath];
	NSInteger n = indexPath.row;
	NSArray *items = [[ASUQuizDB allQuizes] Quizes];
	ASUQuiz *item = items[n];
	cell.textLabel.text = [item description];
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ASUQuiz *quiz = [[[ASUQuizDB allQuizes] Quizes] objectAtIndex:indexPath.row];
	
	NSNumber *prevScore = [self.currentStudent hasTookthisQuizBefore:quiz.quizName];
	
	
	NSLog(@"button pressed row = %d and prev score = %d",indexPath.row, [[quiz Questions] count] );
	
	if ([prevScore isEqualToNumber:[NSNumber numberWithInt:-1]]) {
		ASUQuizViewController *aqvc = [[ASUQuizViewController alloc] initWithStudent:self.currentStudent takingQuiz:quiz];
		[self.navigationController pushViewController:aqvc animated:YES];
	}else {
		ASUScoreViewController *asvc = [[ASUScoreViewController alloc] initWithScore:prevScore from:[NSNumber numberWithInt:[quiz.Questions count]]
										 forQuizName:quiz.quizName];
		[self.navigationController pushViewController:asvc animated:YES];
	}
}

@end
