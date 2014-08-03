//
//  ASUCourse.m
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import "ASUCourse.h"

@implementation ASUCourse

-(NSString *)description {
	return [NSString stringWithFormat:@"name =%@, code=%@, id=%@, numberofquizes=%@", self.name,
		self.code, self.course_id, self.quiz_count];
}

@end
