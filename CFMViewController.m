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

- (IBAction)CVVEditingStarted:(UITextField *)sender {
    self.view.cardLogo = [UIImage imageNamed:@"CVV"];
}
- (IBAction)CVVEditingEnded:(UITextField *)sender {
    self.view.cardLogo = [UIImage imageNamed:self.view.cardType];
}


- (IBAction)creditCardNumberChanged:(UITextField *)sender {
    if (self.view.cardNumber.length == 5 || self.view.cardNumber.length == 6) {
        self.view.cardType = [CFMCreditCard typeForCreditCardNumber:self.view.cardNumber];
    } else if (([self.view.cardType isEqualToString:@"Amex"] && self.view.cardNumber.length == 15) || self.view.cardNumber.length == 16) {
        [self.view CVVEnable:YES];
    }
}



- (IBAction)saveButtonPressed:(UIButton *)sender {
    NSString *cardNumber = self.view.cardNumber;
    NSString *cardType = self.view.cardType;
    NSDate *expirationDate = self.view.expirationDate;
    NSString *CVVNumber = self.view.CVVNumber;
    
    CFMCreditCard *creditCard = [[CFMCreditCard alloc] initWithCardNumber:cardNumber cardType:cardType expirationDate:expirationDate CVVNumber:CVVNumber];
    
    if (creditCard.isValid) {
        [self showMessageSuccess];
        [[CFMRepositoryProvider getRepository] addCard:creditCard];
        [self.view clearForm];
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
