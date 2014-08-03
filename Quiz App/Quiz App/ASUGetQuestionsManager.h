//
//  ASUGetQuestionsManager.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/3/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASUCommunicationDelegate;

@interface ASUGetQuestionsManager : NSObject

@property (weak, nonatomic) id<ASUCommunicationDelegate> delegate;

-(void)getQuestions:(NSNumber *)QuestionsID;

@end
