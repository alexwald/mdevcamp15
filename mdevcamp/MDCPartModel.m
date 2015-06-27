//
//  MDCPartModel.m
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import "MDCPartModel.h"

@implementation MDCPartModel

+ (instancetype)modelWithName:(NSString *)name {
    MDCPartModel *model = [[MDCPartModel alloc] init];
    model.name = name;
    return  model;
}

@end
