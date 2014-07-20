//
//  ASUStudentDB.m
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUStudentDB.h"
#import "ASUStudent.h"

@interface ASUStudentDB ()

@property (nonatomic) NSMutableArray *privateList;

@end

@implementation ASUStudentDB

+(instancetype) allStudents {
	static ASUStudentDB* SDB=nil;
	if (!SDB) {
		SDB = [[self alloc] initPrivate];
		ASUStudent *temp = [[ASUStudent alloc] initWithUserName:@"Yousef hamza"andPassword:@"12345678"];
		[SDB addStudnet:temp];
		ASUStudent *temp1 = [[ASUStudent alloc] initWithUserName:@"Aly Osama"andPassword:@"12345678"];
		[SDB addStudnet:temp1];
		ASUStudent *temp2 = [[ASUStudent alloc] initWithUserName:@"Khaled Essam"andPassword:@"12345678"];
		[SDB addStudnet:temp2];
		ASUStudent *temp3 = [[ASUStudent alloc] initWithUserName:@"Gehad Ruby"andPassword:@"12345678"];
		[SDB addStudnet:temp3];
	}
	return SDB;
}

- (instancetype)init
{
	@throw [NSException exceptionWithName:@"Singleton"
				       reason:@"Use +[ASUStudentDB StudnentsDB]"
				     userInfo:nil];
	return nil;
}
- (instancetype) initPrivate{
	
	self= [super init];
	if(self) {
		self.privateList = [[NSMutableArray alloc] init];
	}
	return  self;
}


-(void)addStudnet:(ASUStudent *)student {
	[self.privateList addObject:student];
}

-(NSArray *)Students{
	return self.privateList;
}
@end
