//
//  CFMCreditCardTest.m
//  CardForm
//
//  Created by Luka Usalj on 20/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "Kiwi.h"
#import "CFMRepositoryProvider.h"
#import "CFMCreditCard.h"

SPEC_BEGIN(CreditCard)

describe(@"validationTest", ^{
    it(@"should check whether card number is valid or not", ^{
        [[theValue([CFMCreditCard isValidForCardNumber:@"54356345632421"]) should] equal:theValue(NO)];
    });
});

describe(@"errorCheckingTest", ^{
    
    it(@"should check if message asks user to enter card number", ^{
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:@""
                                                                     cardType:@""
                                                               expirationDate:nil
                                                                    CVVNumber:@""];
        [[[creditCard errorMessage] should] equal:@"Please enter credit card number"];
    });
    
    it(@"should check if message asks user to enter expiration date", ^{
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:@"345634563465434"
                                                                     cardType:@"Amex"
                                                               expirationDate:nil
                                                                    CVVNumber:@"4444"];
        [[[creditCard errorMessage] should] equal:@"Please enter credit card expiration date"];
    });
    
    it(@"should check if message asks user to enter CVV number", ^{
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:@"345634563465434"
                                                                     cardType:@"Amex"
                                                               expirationDate:[NSDate dateWithTimeIntervalSinceNow:99999999]
                                                                    CVVNumber:@""];
        [[[creditCard errorMessage] should] equal:@"Please enter CVV number"];
    });
    
    it(@"should check that no error message appear", ^{
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:@"345634563465434"
                                                                     cardType:@"Amex"
                                                               expirationDate:[NSDate dateWithTimeIntervalSinceNow:99999999]
                                                                    CVVNumber:@"4444"];
        [[[creditCard errorMessage] should] beNil];
    });
});

SPEC_END