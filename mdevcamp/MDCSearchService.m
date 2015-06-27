//
//  MDCSearchService.m
//  mdevcamp
//
//  Created by Alexander Wald on 25/06/15.
//  Copyright (c) 2015 passionMakesUs. All rights reserved.
//

#import "MDCSearchService.h"
#import "MDCPartModel.h"
#import <ReactiveCocoa.h>

@interface MDCSearchService()

@property (nonatomic, strong) NSMutableArray *partsArray;

@end

@implementation MDCSearchService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.partsArray = @[].mutableCopy;
        NSArray *partStrings = @[@"motor rtz",@"tyres abc", @"brakes ilm", @"clutch xyz", @"motor asd",@"motor iop", @"motor 123", @"motor456", @"motor abd", @"motor abe"];
        
        for (NSString *partString in partStrings) {
            MDCPartModel *partModel = [MDCPartModel modelWithName:partString];
            [self.partsArray addObject:partModel];
        }
        
    }
    return self;
}

- (void)searchWithString:(NSString *)string completionBlock:(CompletionBlock)completionBlock {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        [NSThread sleepForTimeInterval:1.0f];

        NSArray *results = [[self.partsArray.rac_sequence filter:^BOOL(MDCPartModel *model) {
            return [model.name containsString:string];
        }] array];
        
        completionBlock(results, nil);
    });
}

-(RACSignal *)signalForSearchWithString:(NSString *)string {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"searching for %@", string);
        
        [self searchWithString:string completionBlock:^(NSArray *results, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            } else  {
                [subscriber sendNext:results];
                [subscriber sendCompleted];
            }

        }];
        return nil;
    }];
}

@end