//
//  ASUCommunicationDelegate.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/2/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASUCommunicationDelegate <NSObject>

- (void)receivedDataJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

@end
