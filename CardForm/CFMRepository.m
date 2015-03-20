//
//  CFMRepository.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMRepository.h"

@interface CFMRepository()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CFMRepository

- (void)addCard:(CFMRepository *)creditCard
{
    [self.cards addObject:creditCard];
}

- (void)removeCard:(CFMRepository *)creditCard
{
    [self.cards removeObject:creditCard];
}

- (NSArray *)getAllCards
{
    return [self.cards copy]; 
}

- (void)removeAllCards
{
    self.cards = [[NSMutableArray alloc] init];
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

@end
