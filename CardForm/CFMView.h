//
//  CFMView.h
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFMViewController.h"

@interface CFMView : UIView
@property (nonatomic, strong) NSString *cardNumber;
@property (nonatomic, strong) NSString *expirationDate;
@property (nonatomic, strong) NSString *CVVNumber;
@property (nonatomic, strong) UIImage *cardLogo;
- (void)setController:(CFMViewController *)controller;
- (void)disableCreditCardNumberInput;
- (void)setCardLogo:(UIImage *)cardLogo;
@end
