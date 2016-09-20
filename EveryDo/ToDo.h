//
//  ToDo.h
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *toDoDescription;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, assign) BOOL isCompletedIndicator;

- (instancetype)initWithTitle:(NSString*)title ToDoDescription:(NSString*)description PriorityNumber:(int)number IsCompletedIndicator:(BOOL)indicator;

@end
