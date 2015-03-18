//
//  CFMViewController.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMViewController.h"
#import "CFMView.h"

@interface CFMViewController()
@property (strong, nonatomic) IBOutlet CFMView *view;

@end


@implementation CFMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    [self.view setController:self];
}

- (void)onCreditCardNumberChanged:(NSString *)creditCardNumber
{
    if (creditCardNumber.length == 6) {
        NSString *creditCardType = [self creditCardTypeForNumber:creditCardNumber];
        if (!creditCardType) {
            [self.view disableCreditCardNumberInput];
        } else {
            UIImage *imageLogo = [UIImage imageNamed:creditCardType];
            [self.view setCardLogo:imageLogo];
        }
    }
}

- (NSString *)creditCardTypeForNumber:(NSString *)creditCardNumber
{
    return nil;
}

@end
