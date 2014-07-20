//
//  ASUScoreViewController.h
//  Quiz App
//
//  Created by Yousef Hamza on 7/15/14.
//  Copyright (c) 2014 yousef hamza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASUScoreViewController : UIViewController
-(instancetype) initWithScore:(NSNumber *)lastScore
			 from:(NSNumber *)total
		  forQuizName:(NSString *)name;

@end
