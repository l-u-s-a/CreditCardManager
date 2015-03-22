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
    [self.view setFocusOnCreditCardNumber];
}


- (IBAction)creditCardNumberChanged:(UITextField *)sender {
    self.view.cardType = [CFMCreditCard typeForCreditCardNumber:self.view.cardNumber];
}


- (IBAction)saveButtonPressed:(UIButton *)sender {
    CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:self.view.cardNumber
                                                                 cardType:self.view.cardType
                                                           expirationDate:self.view.expirationDate
                                                                CVVNumber:self.view.CVVNumber];
    if (creditCard.isValid) {
        [self showMessageSuccess];
        [[CFMRepositoryProvider repository] addCard:creditCard];
        [self.view clearForm];
        [self.view setFocusOnCreditCardNumber];
    } else {
        [self showMessageWithErrorDescription:[creditCard errorMessage]];
    }
}

- (void)showMessageSuccess
{
    [[[UIAlertView alloc] initWithTitle:@"Validated!" message:@"Credit card number seems ok!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)showMessageWithErrorDescription:(NSString *)errorDescription
{
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
