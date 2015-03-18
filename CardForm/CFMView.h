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
- (void)setController:(CFMViewController *)controller;
- (void)disableCreditCardNumberInput;
@end
