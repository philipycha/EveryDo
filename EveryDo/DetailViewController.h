//
//  DetailViewController.h
//  EveryDo
//
//  Created by Philip Ha on 2016-09-20.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

