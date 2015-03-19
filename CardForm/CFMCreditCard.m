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

+ (NSString *)typeForCardNumber:(NSString *)creditCardNumber
{
    return @"Amex";
}
@end
