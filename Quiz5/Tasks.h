//
//  Tasks.h
//  Quiz5
//
//  Created by Steve Chakif on 3/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject

@property (nonatomic) float urgency;
@property (nonatomic, retain) NSDate *dueDate;
@property (nonatomic, retain) NSString *taskName;

@end
