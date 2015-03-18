//
//  SampleTest.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

describe(@"Test", ^{
    it(@"should to something nice", ^{
        int a = 5;
        int b = 6;
        [[theValue(a + b) should] equal:theValue(11)];
    });
});


SPEC_END
