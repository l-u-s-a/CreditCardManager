//
//  CFMCreditCard.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMCreditCard.h"
#import "Math.h"

@implementation CFMCreditCard

- (instancetype)initWithCardNumber:(NSString *)creditCardNumber cardType:(NSString *)creditCardType expirationDate:(NSDate *)expirationDate CVVNumber:(NSString *)CVVNumber
{
    self = [super init];
    if (self) {
        self.creditCardNumber = creditCardNumber;
        self.creditCardType = creditCardType;
        self.expirationDate = expirationDate;
        self.CVVNumber = CVVNumber;
    }
    return self;
}

- (NSString *)errorMessage
{
    if (self.creditCardNumber.length == 0) {
        return @"Please enter credit card number";
    } else if (!self.creditCardType) {
        return @"Card type unrecognized";
    } else if ([self.creditCardType isEqualToString:@"Amex"] && self.creditCardNumber.length != 15) {
        return @"Amex card must have 15 digits";
    } else if (![self.creditCardType isEqualToString:@"Amex"] && self.creditCardNumber.length != 16) {
        return [NSString stringWithFormat:@"%@ must have 16 digits", self.creditCardType];
    } else if (![CFMCreditCard isValidForCardNumber:self.creditCardNumber]) {
        return @"Invalid card number";
    } else if (!self.expirationDate) {
        return @"Please enter credit card expiration date";
    } else if ([self.expirationDate compare:[NSDate date]] == NSOrderedAscending) {
        return @"Oops! Your card seems to be out of date!";
    } else if (self.CVVNumber.length == 0) {
        return @"Please enter CVV number";
    } else if ([self.creditCardType isEqualToString:@"Amex"] && self.CVVNumber.length != 4) {
        return @"Amex card CVV has 4 digits";
    } else if (![self.creditCardType isEqualToString:@"Amex"] && self.CVVNumber.length != 3) {
        return [NSString stringWithFormat:@"%@ has 3-digit CVV", self.creditCardType];
    }
    return nil;
}

- (BOOL)isValid
{
    return ![self errorMessage];
}

+ (BOOL)isValidForCardNumber:(NSString *)cardNumber
{
    return [Luhn validateString:cardNumber];
}

+ (NSString *)typeForCreditCardNumber:(NSString *)creditCardTypeIdentificator
{
    if (creditCardTypeIdentificator.length > 6) {
        creditCardTypeIdentificator = [creditCardTypeIdentificator substringToIndex:6];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    double cardIdentificator = [[formatter numberFromString:creditCardTypeIdentificator] doubleValue];
    
    if ((cardIdentificator >= 340000 && cardIdentificator < 350000) || (cardIdentificator >= 370000 && cardIdentificator < 380000)) {
            return @"Amex";
    } else if ((cardIdentificator >= 601100 && cardIdentificator < 601200) || (cardIdentificator >= 622126 && cardIdentificator <= 622925) || (cardIdentificator >= 644000 && cardIdentificator < 650000) || (cardIdentificator >= 650000 && cardIdentificator < 660000)) {
            return @"Discover";
    } else if (cardIdentificator >= 352800 && cardIdentificator < 359000) {
            return @"JCB";
    } else if (cardIdentificator >= 510000 && cardIdentificator < 560000) {
            return @"Mastercard";
    } else if (cardIdentificator >= 400000 && cardIdentificator < 500000) {
            return @"Visa";
    } else {
        return nil;
    }
}

@end
