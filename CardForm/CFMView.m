//
//  CFMView.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMView.h"
#import "CFMCreditCard.h"

@interface CFMView()
@property (strong, nonatomic) CFMViewController *controller;
@property (strong, nonatomic) IBOutlet UITextField *creditCardTextField;
@property (strong, nonatomic) IBOutlet UITextField *expirationDateTextField;
@property (strong, nonatomic) IBOutlet UITextField *CVVTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creditCardImageView;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation CFMView

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *cardType = [CFMCreditCard typeForCreditCardNumber:textField.text];
    if (self.cardNumber.length == 6 && [cardType isEqualToString:@"GenericCard"] && ![string isEqualToString:@""]) {
        textField.text = [textField.text substringToIndex:6];
        return NO;
    } else if (([cardType isEqualToString:@"Amex"] && self.cardNumber.length == 15 && ![string isEqualToString:@""]) || (self.cardNumber.length == 16 && ![string isEqualToString:@""])) {
        textField.text = [textField.text substringToIndex:textField.text.length];
        [self CVVEnableIf:YES];
        return NO;
    }
    self.CVVNumber = @"";
    [self CVVEnableIf:NO];
    return YES;
}


- (IBAction)creditCardNumberChanged:(UITextField *)sender {
    NSString *cardType = @"GenericCard";
    if (self.cardNumber.length == 5 || self.cardNumber.length == 6) {
        cardType = [CFMCreditCard typeForCreditCardNumber:self.cardNumber];
        self.cardLogo = [UIImage imageNamed:cardType];
    }
}


- (void)setCardNumber:(NSString *)cardNumber
{
    self.creditCardTextField.text = cardNumber;
}

- (NSString *)cardNumber
{
    return self.creditCardTextField.text;
}

- (void)setExpirationDate:(NSString *)expirationDate
{
    self.expirationDateTextField.text = expirationDate;
}

- (NSString *)expirationDate
{
    return self.expirationDateTextField.text;
}

- (void)setCVVNumber:(NSString *)CVVNumber
{
    self.CVVTextField.text = CVVNumber;
}

- (NSString *)CVVNumber
{
    return self.CVVTextField.text;
}

- (void)setCardLogo:(UIImage *)cardLogo
{
    self.creditCardImageView.image = cardLogo;
}

- (UIImage *)cardLogo
{
    return self.creditCardImageView.image;
}


- (void)setController:(CFMViewController *)controller
{
    _controller = controller;
}

- (void)disableCreditCardNumberInput
{
//    self.creditCardTextField.
}

- (void)CVVEnableIf:(BOOL)condition
{
    self.CVVTextField.enabled = condition;
}



@end
