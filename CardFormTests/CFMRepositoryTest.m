//
//  CFMRepositoryTest.m
//  CardForm
//
//  Created by Luka Usalj on 22/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "Kiwi.h"
#import "CFMRepositoryProvider.h"

SPEC_BEGIN(Repository)

describe(@"repositoryTest", ^{
    
    beforeAll(^{
        [[CFMRepositoryProvider repository] addCard:[[CFMCreditCard alloc] init]];
        [[CFMRepositoryProvider repository] addCard:[[CFMCreditCard alloc] init]];
    });
    
    it(@"should check if 2 elements are added to repository", ^{
        [[theValue([[CFMRepositoryProvider repository] getAllCards].count) should] equal:theValue(2)];
    });
    
    afterAll(^{
        [[CFMRepositoryProvider repository] removeAllCards];
    });
});

SPEC_END
