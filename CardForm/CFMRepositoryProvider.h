//
//  CFMRepositoryProvider.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRepository.h"


@interface CFMRepositoryProvider : NSObject
+ (id <IRepository>)repository;
@end
