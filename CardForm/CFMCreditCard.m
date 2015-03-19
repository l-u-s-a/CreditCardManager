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
@end
