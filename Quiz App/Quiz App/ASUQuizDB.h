//
//  ASUQuizDB.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASUQuiz;

@interface ASUQuizDB : NSObject

@property (nonatomic, readonly) NSArray *Quizes;

+(instancetype) allQuizes;

-(instancetype) initPrivate;

-(void)addQuiz:(ASUQuiz *)quiz;

-(NSArray *)Quizes;

@end
