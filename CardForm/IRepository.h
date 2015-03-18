//
//  IRepository.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CreditCard.h"

@protocol IRepository <NSObject>
- (void)addCard:(CreditCard *)creditCard;
- (void)removeCard:(CreditCard *)creditCard;
- (NSArray *)getAllCards;
@end
