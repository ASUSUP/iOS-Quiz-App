//
//  ASUQuizListViewController.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASUStudent;
@interface ASUQuizListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *_courses;
@property (nonatomic, strong) ASUStudent* currentStudent;

- (instancetype)initWithType:(NSString *)type;

@end
