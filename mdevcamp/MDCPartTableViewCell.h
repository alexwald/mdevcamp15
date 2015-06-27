//
//  PartTableViewCell.h
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCPartModel.h"

@interface MDCPartTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *partTitle;
@property (nonatomic, strong) MDCPartModel *partModel;

@end
