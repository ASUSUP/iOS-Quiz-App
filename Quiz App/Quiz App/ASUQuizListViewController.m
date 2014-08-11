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
#import "ASUCommunicationDelegate.h"
#import "ASUGetCoursesManager.h"
#import "ASUGetQuizManager.h"
#import "ASUQuizDB.h"
#import "ASUStudent.h"
#import "ASUQuiz.h"
#import "ASUCourse.h"

@interface ASUQuizListViewController () <ASUCommunicationDelegate> {
	NSString *_type;
	NSArray *_courses;
	NSArray *_coursesNames;
	NSMutableArray *_quizes;
}

@end

@implementation ASUQuizListViewController


- (instancetype)initWithType:(NSString *)type{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
		_type = type;
		UINavigationItem *nvitem = self.navigationItem;
		nvitem.title = @"loading..";
		nvitem.hidesBackButton= YES;
	}
	if ([type isEqualToString:@"Courses"]) {
		ASUGetCoursesManager *manager= [[ASUGetCoursesManager alloc] init];
		manager.delegate = self;
		[manager getCourses];
	}
	return self;
}

-(instancetype)initWithType:(NSString *)type
			   :(NSNumber *)Course_ID{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
		_type = type;
		UINavigationItem *nvitem = self.navigationItem;
		nvitem.title = @"loading..";
		nvitem.hidesBackButton= YES;
	}
	ASUGetQuizManager *manager = [[ASUGetQuizManager alloc] init];
	manager.delegate = self;
	[manager GetQuizes:Course_ID];
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
	if ([_type isEqualToString:@"Quizes"]) {
		return [_quizes count];
	}else {
		return [_courses count];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"forIndexPath:indexPath];
	NSInteger n = indexPath.row;
	if ([_type isEqualToString:@"Courses"]) {
		NSLog(@"getting to print courses :%@",[[_courses objectAtIndex:indexPath.row] name]);
		cell.textLabel.text = [[_courses objectAtIndex:indexPath.row] name];
	} else {
		cell.textLabel.text = [_quizes[n] name];
	}
	
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([_type isEqualToString:@"Courses"]) {
		ASUQuizListViewController *nextView = [[ASUQuizListViewController alloc] initWithType:@"Quizes" :[_courses[indexPath.row] course_id]];
		[self.navigationController pushViewController:nextView animated:YES];
	}
//	ASUQuiz *quiz = [[[ASUQuizDB allQuizes] Quizes] objectAtIndex:indexPath.row];
//	
//	NSNumber *prevScore = [self.currentStudent hasTookthisQuizBefore:quiz.quizName];
//	
//	
//	NSLog(@"button pressed row = %d and prev score = %d",indexPath.row, [[quiz Questions] count] );
//	
//	if ([prevScore isEqualToNumber:[NSNumber numberWithInt:-1]]) {
//		ASUQuizViewController *aqvc = [[ASUQuizViewController alloc] initWithStudent:self.currentStudent takingQuiz:quiz];
//		[self.navigationController pushViewController:aqvc animated:YES];
//	}else {
//		ASUScoreViewController *asvc = [[ASUScoreViewController alloc] initWithScore:prevScore from:[NSNumber numberWithInt:[quiz.Questions count]]
//										 forQuizName:quiz.quizName];
//		[self.navigationController pushViewController:asvc animated:YES];
//	}
}

-(void)receivedDataJSON:(NSData *)objectNotation {
	if ([_type isEqualToString:@"Courses"]) {
		NSError *error =nil;
		NSMutableArray *temp = [[NSMutableArray alloc] init];
		NSArray *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&error];
		NSLog(@"%@", parsedObject);
		for (NSDictionary *course in parsedObject) {
			ASUCourse *newcourse = [[ASUCourse alloc] init];
			newcourse.name = (NSString *)[course valueForKey:@"name"];
			newcourse.code = (NSString *)[course valueForKey:@"code"];
			newcourse.course_id = (NSNumber *)[course valueForKey:@"course_id"];
			newcourse.quiz_count =(NSNumber *)[course valueForKey:@"quiz_count"];
			[temp addObject:newcourse];
			NSLog(@"now: %@", temp);
		}
		_courses = temp;
		NSLog(@"Courses:\n%@", _courses);
		self.navigationItem.title = @"Courses";
	} else {
		NSError *error = nil;
		_quizes = [[NSMutableArray alloc] init];
		NSArray *parseedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&error];
		NSLog(@"ParsedObject: %@", parseedObject);
		
		for (NSDictionary *quiz in parseedObject) {
			NSString *quizname = (NSString *)[parseedObject valueForKey:@"name"];
			[_quizes addObject:quizname];
		}
		NSLog(@"quizes names: %@", _quizes);
		self.navigationItem.title = @"Quizes";
	}
	[self.tableView reloadData];
}

-(void)fetchingGroupsFailedWithError:(NSError *)error {
	NSLog(@"Error");
	NSLog(@"%@",error);
}

@end
