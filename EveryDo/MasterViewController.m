//
//  MasterViewController.m
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "CustomTableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ToDo *toDo1 = [[ToDo alloc] initWithTitle:@"Doge" ToDoDescription:@"Remember to call the vet and also buy food for le doge, walk the doge around the park and make sure it takes a dump so it doesn't crap on the floor at home." PriorityNumber:1 IsCompletedIndicator:NO];
    
    ToDo *toDo2 = [[ToDo alloc] initWithTitle:@"Buy Groceries" ToDoDescription:@"Buy: cheese, chicken breast, cabbage, filet mignon, ribeye, buns, sausage, as you can see all of this is for a bbq. Make sure you also buy things for your everyday lunch and stuff you know what you like." PriorityNumber:2 IsCompletedIndicator:NO];
    
    ToDo *toDo3 = [[ToDo alloc] initWithTitle:@"Call Mom" ToDoDescription:@"Update mom on current situation, daily feedback. blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah" PriorityNumber:2 IsCompletedIndicator:NO];
    
    ToDo *toDo4 = [[ToDo alloc] initWithTitle:@"Plan Vacation" ToDoDescription:@"Research locations, cities, hotel, flights, all good spots make list. If you can't find anything that you like, prepare to spend your vacation at home, where you'll do nothing but eat food and gain weight. good stuff." PriorityNumber:3 IsCompletedIndicator:NO];
    
    ToDo *toDo5 = [[ToDo alloc] initWithTitle:@"Play Basketball" ToDoDescription:@"Call the boys, let's play some pick up, where we going to go? Probably the Oval. Remember to bring your Oval card cause last time you didn't and you had to pay 17 bucks which is a total rip off." PriorityNumber:2 IsCompletedIndicator:NO];
    
    ToDo *toDo6 = [[ToDo alloc] initWithTitle:@"Finish Work" ToDoDescription:@"Whatever that's left to do for today, partition some time to do some extra on it. If you don't finish the work you'll get your ass beat. the end." PriorityNumber:1 IsCompletedIndicator:NO];
    
    self.toDoArray = [[NSMutableArray alloc] initWithObjects:toDo1, toDo2, toDo3, toDo4, toDo5, toDo6, nil];
    

}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


//#pragma mark - Segues
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//    }
//}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.toDoArray.count;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.toDoArray.count;
    
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
                                 
                                 ToDo *toDo = self.toDoArray[indexPath.row];
                                 
                                 
                                 cell.titleLabel.text = [NSString stringWithFormat:@"%@", toDo.title];
                                 
                                 cell.descriptionLabel.text = [NSString stringWithFormat:@"%@", toDo.toDoDescription];
    
                                cell.priorityLabel.text = [NSString stringWithFormat:@"%d", toDo.priorityNumber];
    
                                 // Configure the cell...
                                 
                                 return cell;
                                 
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        
        DetailViewController *detailVC = segue.destinationViewController;
        
        CustomTableViewCell *cell = (CustomTableViewCell*)sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        detailVC.toDo = self.toDoArray[indexPath.row];

        
        
    }
    
    
}


@end
