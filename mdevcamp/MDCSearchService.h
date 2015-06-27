//
//  MDCSearchService.h
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

typedef void (^CompletionBlock)(NSArray *results, NSError *error);

@interface MDCSearchService : NSObject

-(void)searchWithString:(NSString *)string completionBlock:(CompletionBlock)completionBlock;

-(RACSignal *)signalForSearchWithString:(NSString *)string;

@end
