//
//  AddToDoViewController.h
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddToDoViewControllerDelegate <NSObject>

-(void)addContent:(ToDo *)addNewToDo;

@end

@interface AddToDoViewController : UIViewController

@property (nonatomic, weak) id <AddToDoViewControllerDelegate>delegate;

@end
