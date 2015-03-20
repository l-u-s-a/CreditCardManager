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
    if (textField == self.CVVTextField) {
        if ([string isEqualToString:@""]) {
            return YES;
        } else if (![self.cardType isEqualToString:@"Amex"] && self.CVVNumber.length == 3) {
            self.CVVNumber = [self.CVVNumber substringToIndex:3];
            return NO;
        } else if (self.CVVNumber.length == 4) {
            return NO;
        }
    } else if (textField == self.creditCardTextField) {
        if ([string isEqualToString:@""]) {
            [self clearCVVField];
            return YES;
        } else if (self.cardNumber.length == 6 && [self.cardType isEqualToString:@"GenericCard"]) {
            self.cardNumber = [self.cardNumber substringToIndex:6];
            return NO;
        } else if (([self.cardType isEqualToString:@"Amex"] && self.cardNumber.length == 15 ) || (self.cardNumber.length == 16)) {
            self.cardNumber = [self.cardNumber substringToIndex:self.cardNumber.length];
            [self CVVEnableIf:YES];
            return NO;
        }
    }
    return YES;
}

- (void)clearCVVField
{
    self.CVVNumber = @"";
    [self CVVEnableIf:NO];
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


- (void)CVVEnableIf:(BOOL)condition
{
    self.CVVTextField.enabled = condition;
}


@end
