//
//  ASULoginManager.h
//  Quiz App
//
//  Created by Yousef Hamza on 8/2/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASUCommunicationDelegate.h"
@interface ASULoginManager : NSObject

@property (weak, nonatomic) id<ASUCommunicationDelegate> delegate;

-(void) checkUsernameAndPassword:(NSString *)username
				 :(NSString *) password;

@end
