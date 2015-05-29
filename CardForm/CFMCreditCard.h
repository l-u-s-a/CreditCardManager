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

/*! Checks all card attributes and returns error message if exists */
- (NSString *)errorMessage;

//+ (UIImage *)imageForCreditCard:(CFMCreditCard *)card;
//+ (UIImage *)imageForCreditCardType:(NSString *)type;
- (UIImage *)image;

/*! Checks first 6 digits of the card and returns matching type(Amex, Discover, ...) */
+ (NSString *)typeForCreditCardNumber:(NSString *)creditCardNumber;

/*! Performs Luhn validation on card number and returns result */
+ (BOOL)isValidForCardNumber:(NSString *)cardNumber;

@end
