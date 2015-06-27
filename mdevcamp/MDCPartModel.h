//
//  MDCPartModel.h
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDCPartModel : NSObject

@property (nonatomic, strong) NSString *name;

+ (instancetype)modelWithName:(NSString *)name;

@end
