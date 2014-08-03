//
//  ASULoginViewController.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASULoginViewController.h"
#import "ASUQuizListViewController.h"
#import "ASUCommunicationDelegate.h"
#import "ASUCommunicationData.h"
#import "ASULoginManager.h"
#import "ASUStudent.h"
#import "ASUStudentDB.h"

@interface ASULoginViewController () <ASUCommunicationDelegate> {
	ASULoginManager *_manager;
}

@property (weak, nonatomic) IBOutlet UITextField *UserNameField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UILabel *StatusLabel;

@end

@implementation ASULoginViewController
	

-(instancetype)init{
	self = [super init];
	if (self) {
		self.navigationItem.title = @"Login";
	}
	return self;
}

-(IBAction)Login:(id)sender {
	_manager = [[ASULoginManager alloc] init];
	_manager.delegate=self;
	[_manager checkUsernameAndPassword:self.UserNameField.text :self.PasswordField.text];
}

-(void) fetchingGroupsFailedWithError:(NSError *)error{
	NSLog(@"%@", error);
}

-(void) receivedDataJSON:(NSData *)objectNotation{
	NSError *error= nil;
	NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&error];
	NSNumber *succededResponse = (NSNumber *)[parsedObject valueForKey:@"succeded"];
	NSLog(@"login : %@", parsedObject);
	if([succededResponse boolValue] == YES){
		[ASUCommunicationData getsessionID:(NSString *) [parsedObject valueForKey:@"session_id"]];
		NSLog(@"Done with session ID: %@", [ASUCommunicationData getsessionID:@"GET"]);
		ASUQuizListViewController *nextView = [[ASUQuizListViewController alloc] initWithType:@"Courses"];
		[self.navigationController pushViewController:nextView animated:YES];
		
	} else {
		NSLog(@"Wrong with error: %@", [parsedObject valueForKey:@"error"]);
		[self.StatusLabel setText:(NSString *) [parsedObject valueForKey:@"error"]];
	}
}



@end
