//
//  ASUCourse.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASUCourse : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSNumber* course_id;
@property (strong, nonatomic) NSNumber* quiz_count;

@end
