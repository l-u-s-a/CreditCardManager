//
//  CFMViewController.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMViewController.h"
#import "CFMView.h"
#import "CFMRepositoryProvider.h"
#import "CFMCreditCard.h"
#import "Luhn.h"

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


- (IBAction)creditCardNumberChanged:(UITextField *)sender {
    NSString *creditCardNumber = sender.text;
    if (creditCardNumber.length < 6) {
        self.view.cardLogo = [UIImage imageNamed:@"GenericCard"];
    }
    if (creditCardNumber.length == 6) {
        NSString *cardType = [CFMCreditCard typeForCreditCardNumber:creditCardNumber];
        if (![cardType  isEqual: @"GenericCard"]) {
            self.view.cardLogo = [UIImage imageNamed:cardType];
        } else {
            [self.view disableCreditCardNumberInput];
        }
    }
}



- (IBAction)saveButtonPressed:(UIButton *)sender {
    NSString *cardNumber = self.view.cardNumber;
    NSString *expirationDate = self.view.expirationDate;
    NSString *CVVNumber = self.view.CVVNumber;
    
    if ([CFMCreditCard isValidForCardNumber:cardNumber
                             expirationDate:expirationDate
                                  CVVNumber:CVVNumber]) {
        CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:cardNumber expirationDate:expirationDate CVVNumber:CVVNumber];
        [[CFMRepositoryProvider getRepository] addCard:creditCard];
    } else {
        //
    }
}



@end
