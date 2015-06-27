//
//  PartTableViewCell.m
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import "MDCPartTableViewCell.h"
#import <ReactiveCocoa.h>

@implementation MDCPartTableViewCell

- (void)awakeFromNib {
    RAC(self.partTitle, text) = [RACObserve(self, partModel.name) ignore:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
