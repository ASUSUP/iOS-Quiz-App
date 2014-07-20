//
//  ASULoginViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASULoginViewController.h"
#import "ASUQuizListViewController.h"
#import "ASUStudent.h"
#import "ASUStudentDB.h"

@interface ASULoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserNameField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UILabel *StatusLabel;

@end

@implementation ASULoginViewController

-(instancetype) init{
	self = [super init];
	if (self) {
		self.navigationItem.title = @"Login";
	}
	return self;
}

-(IBAction)Login:(id)sender {
	NSString *username= self.UserNameField.text;
	NSString *password=  self.PasswordField.text;
	
	for (ASUStudent* student in [[ASUStudentDB allStudents] Students]) {
		NSLog(@"%@",student);
		if ([student userHasUsername:username andPassword:password]) {
			ASUQuizListViewController *aqlvc = [[ASUQuizListViewController alloc] init];
			aqlvc.currentStudent =student;
			[self.view endEditing:YES];
			[self.navigationController pushViewController:aqlvc animated:YES];
			return;
		}
	}
	self.StatusLabel.text = @"Not Exist";
}

@end
