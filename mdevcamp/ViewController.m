//
//  ViewController.m
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa.h>
#import "UIColor+customColors.h"
#import "MDCSearchService.h"
#import "MDCPartTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *searchResultsArray;
@property (nonatomic, strong) MDCSearchService *searchService;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchService = [[MDCSearchService alloc] init];
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    //farba pozadia
    [[self.searchField.rac_textSignal
      map:^id(NSString *text) {
          return text.length >= 3 ? [UIColor whiteColor]: [UIColor notEnoughCharactersYellow];
      }]
     setKeyPath:@"backgroundColor" onObject:self.searchField];
    
    //logic
   [[[[[[self.searchField.rac_textSignal
     throttle:0.5]
     filter:^BOOL(NSString *text) {
         return text.length > 3;
     }]

     flattenMap:^RACStream *(NSString *text) {
        return [self.searchService signalForSearchWithString:text];
     }]
     distinctUntilChanged
     ]
     deliverOnMainThread
     ]
     subscribeNext:^(NSArray *searchResults) {
         self.searchResultsArray = searchResults.mutableCopy;
         
         NSLog(@"reloading tableview");
         [self.tableView reloadData];
         [self.tableView scrollsToTop];
     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark uitableview

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MDCPartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MDCItemCell" forIndexPath:indexPath];
    cell.partModel = [self.searchResultsArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.searchResultsArray count];
}

@end
