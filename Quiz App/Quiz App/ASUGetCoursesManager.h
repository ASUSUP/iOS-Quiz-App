//
//  ASUGetCoursesManager.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASUCommunicationDelegate;


@interface ASUGetCoursesManager : NSObject

@property (weak, nonatomic) id<ASUCommunicationDelegate> delegate;

-(void)getCourses;
@end
