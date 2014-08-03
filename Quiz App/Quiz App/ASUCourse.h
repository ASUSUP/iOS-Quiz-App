//
//  ASUCourse.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASUCourse : NSObject

@property (weak, nonatomic) NSString* name;
@property (weak, nonatomic) NSString* code;
@property (weak, nonatomic) NSString* course_id;
@property (weak, nonatomic) NSNumber* quiz_count;

@end
