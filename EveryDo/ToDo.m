//
//  ToDo.m
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString*)title ToDoDescription:(NSString*)description PriorityNumber:(int)number IsCompletedIndicator:(BOOL)indicator;
{
    self = [super init];
    if (self) {
        _title = title;
        _toDoDescription = description;
        _priorityNumber = number;
        _isCompletedIndicator = indicator;
    }
    return self;
}



@end
