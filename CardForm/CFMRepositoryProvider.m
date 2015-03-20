//
//  CFMRepositoryProvider.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMRepositoryProvider.h"
#import "CFMRepository.h"

static id<IRepository> repository;

@implementation CFMRepositoryProvider

+ (id <IRepository>)repository
{
    if (!repository) repository = [[CFMRepository alloc] init];
    return repository;
}

@end
