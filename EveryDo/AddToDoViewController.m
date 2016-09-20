//
//  AddToDoViewController.m
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *setPriorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *setTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *setDescriptionTextField;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.delegate = self.parentViewController;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressedDoneButton:(UIButton *)sender {
    
    ToDo *addNewToDo = [[ToDo alloc] init];
    addNewToDo.title = self.setTitleTextField.text;
    
    addNewToDo.priorityNumber = self.setPriorityTextField.text.intValue;
    
    addNewToDo.toDoDescription = self.setDescriptionTextField.text;
    
    
    addNewToDo.isCompletedIndicator = NO;
    
    NSLog(@"Title: %@ Description: %@ Priority: %d ", addNewToDo.title, addNewToDo.toDoDescription, addNewToDo.priorityNumber);
    
    if ([self.delegate respondsToSelector:@selector(addContent:)]) {
        [self.delegate addContent:addNewToDo];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField{
    
    [textField resignFirstResponder];
    return YES;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
