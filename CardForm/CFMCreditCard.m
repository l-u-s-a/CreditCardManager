//
//  CFMCreditCard.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMCreditCard.h"

@implementation CFMCreditCard

- (instancetype)initWithCardNumber:(NSString *)creditCardNumber expirationDate:(NSString *)expirationDate CVVNumber:(NSString *)CVVNumber
{
    self = [super init];
    if (self) {
        self.creditCardNumber = creditCardNumber;
        self.expirationDate = expirationDate;
        self.CVVNumber = CVVNumber;
    }
    return self;
}

+ (BOOL)isValidForCardNumber:(NSString *)creditCardNumber expirationDate:(NSString *)expirationDate CVVNumber:(NSString *)CVVNumber
{
    return false;
}

+ (UIImage *)imageForCreditCardType:(OLCreditCardType)creditCardType
{
    NSString *cardName;
    switch (creditCardType) {
        case OLCreditCardTypeAmex:
            cardName = @"Amex";
            break;
        case OLCreditCardTypeDiscover:
            cardName = @"Discover";
            break;
        case OLCreditCardTypeJCB:
            cardName = @"JCB";
            break;
        case OLCreditCardTypeMastercard:
            cardName = @"MasterCard";
            break;
        case OLCreditCardTypeVisa:
            cardName = @"Visa";
            break;
        default:
            cardName = @"GenericCard";
            break;
    }
    return [UIImage imageNamed:cardName];
}

+ (NSString *)typeForCreditCardNumber:(NSString *)creditCardNumber
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    double cardNumber = [[formatter numberFromString:creditCardNumber] doubleValue];
    
    if ((cardNumber >= 340000 && cardNumber < 350000) || (cardNumber >= 370000 && cardNumber < 380000)) {
        return @"Amex";
    } else if ((cardNumber >= 601100 && cardNumber < 601200) || (cardNumber >= 622126 && cardNumber <= 622925) || (cardNumber >= 644000 && cardNumber < 650000) || (cardNumber >= 650000 && cardNumber < 660000)) {
        return @"Discover";
    } else if (cardNumber >= 352800 && cardNumber < 359000) {
        return @"JCB";
    } else if (cardNumber >= 510000 && cardNumber < 560000) {
        return @"MasterCard";
    } else if (cardNumber >= 400000 && cardNumber < 500000) {
        return @"Visa";
    } else {
        return @"GenericCard";
    }
}


@end
