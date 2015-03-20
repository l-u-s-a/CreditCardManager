//
//  CFMCreditCardTest.m
//  CardForm
//
//  Created by Luka Usalj on 20/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "Kiwi.h"
#import "CFMCreditCard.h"

SPEC_BEGIN(CreditCard)

describe(@"validationTest", ^{
    it(@"should check whether card number is valid or not", ^{
        [[theValue([CFMCreditCard isValidForCardNumber:@"54356345632421"]) should] equal:theValue(NO)];
    });
});

describe(@"errorCheckingTest", ^{
    it(@"should return message that describes specific error", ^{
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:@"345436546"
                                                                     cardType:@"Amex"
                                                               expirationDate:[NSDate date]
                                                                    CVVNumber:@"4444"];
        [[[creditCard errorMessage] should] equal:@"Invalid card number"];
        
        creditCard = [[CFMCreditCard alloc] initWithCardNumber:@""
                                                      cardType:@"Amex"
                                                expirationDate:[NSDate date]
                                                     CVVNumber:@"4444"];
        [[[creditCard errorMessage] should] equal:@"Please enter credit card number"];
    });
});

SPEC_END