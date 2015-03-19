//
//  CFMCreditCard.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CFMCreditCard : NSObject
@property (nonatomic, strong) NSString *creditCardNumber;
@property (nonatomic, strong) NSString *expirationDate;
@property (nonatomic, strong) NSString *CVVNumber;
- (instancetype)initWithCardNumber:(NSString *)creditCardNumber expirationDate:(NSString *)expirationDate CVVNumber:(NSString *)CVVNumber;
+ (BOOL)isValidForCardNumber:(NSString *)creditCardNumber expirationDate:(NSString *)expirationDate CVVNumber:(NSString *)CVVNumber;
+ (NSString *)typeForCardNumber:(NSString *)creditCardNumber;
@end
