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
        } else if (self.cardNumber.length == 6 && (!self.cardType)) {
            self.cardNumber = [self.cardNumber substringToIndex:6];
            return NO;
        } else if (([self.cardType isEqualToString:@"Amex"] && self.cardNumber.length == 15 ) || (self.cardNumber.length == 16)) {
            self.cardNumber = [self.cardNumber substringToIndex:self.cardNumber.length];
            [self CVVEnable:YES];
            return NO;
        }
    }
    return YES;
}

- (IBAction)editingDateEnded:(UITextField *)sender {
    if (!self.expirationDate) {
        self.expirationDateTextField.text = @"";
    }
}

- (void)clearCVVField
{
    self.CVVNumber = @"";
    [self CVVEnable:NO];
}

- (void)setCardNumber:(NSString *)cardNumber
{
    self.creditCardTextField.text = cardNumber;
}

- (NSString *)cardNumber
{
    return self.creditCardTextField.text;
}

- (NSDate *)expirationDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/yy"];
    NSDate *date = [formatter dateFromString:self.expirationDateTextField.text];
    return date;
}
- (IBAction)editingCVVStarted:(UITextField *)sender {
    self.cardLogo = [UIImage imageNamed:@"CVV"];
}

- (IBAction)editingCVVEnded:(UITextField *)sender {
    self.cardLogo = [UIImage imageNamed:self.cardType];
}


- (void)setCVVNumber:(NSString *)CVVNumber
{
    self.CVVTextField.text = CVVNumber;
}

- (NSString *)CVVNumber
{
    return self.CVVTextField.text;
}


- (void)setCardType:(NSString *)cardType
{
    _cardType = cardType;
    NSString *logoName = (self.cardType) ? self.cardType : @"GenericCard";
    self.cardLogo = [UIImage imageNamed:logoName];
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


- (void)CVVEnable:(BOOL)condition
{
    self.CVVTextField.enabled = condition;
}

- (void)clearForm
{
    [self clearCVVField];
    self.cardNumber = @"";
    self.cardType = nil;
    self.expirationDateTextField.text = @"";
}


@end
