//
//  ViewController.h
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField *searchField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

