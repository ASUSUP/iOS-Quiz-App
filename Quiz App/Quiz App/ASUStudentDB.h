//
//  ASUStudentDB.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASUStudent;

@interface ASUStudentDB : NSObject

@property (nonatomic, readonly) NSArray* Students;


+(instancetype) allStudents;

-(instancetype) initPrivate;

-(void)addStudnet:(ASUStudent *)student;

-(NSArray *)Students;

@end
