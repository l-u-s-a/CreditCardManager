//
//  CFMCreditCard.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Luhn.h"

@interface CFMCreditCard : NSObject
@property (nonatomic, strong) NSString *creditCardNumber;
@property (nonatomic, strong) NSString *creditCardType;
@property (nonatomic, strong) NSDate *expirationDate;
@property (nonatomic, strong) NSString *CVVNumber;
@property (nonatomic, assign, getter=isValid) BOOL valid;

- (instancetype)initWithCardNumber:(NSString *)creditCardNumber cardType:(NSString *)creditCardType expirationDate:(NSDate *)expirationDate CVVNumber:(NSString *)CVVNumber;
- (NSString *)errorMessage;
+ (NSString *)typeForCreditCardNumber:(NSString *)creditCardNumber;
+ (BOOL)isValidForCardNumber:(NSString *)cardNumber;
@end
