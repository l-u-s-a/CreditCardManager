//
//  IRepository.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CFMCreditCard.h"

/*! Protocol for storing cards in repository */
@protocol IRepository <NSObject>
- (void)addCard:(CFMCreditCard *)creditCard;
- (void)removeCard:(CFMCreditCard *)creditCard;
- (NSArray *)getAllCards;
- (void)removeAllCards;
@end
