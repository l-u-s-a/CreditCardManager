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
@property (strong, nonatomic) IBOutlet UITextField *creditCardTextField;
@property (strong, nonatomic) IBOutlet UITextField *expirationMonthField;
@property (strong, nonatomic) IBOutlet UITextField *expirationYearField;
@property (strong, nonatomic) IBOutlet UITextField *CVVTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creditCardImageView;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSString *expirationMonth;
@property (strong, nonatomic) NSString *expirationYear;
@end

@implementation CFMView

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        if (textField.text.length == 1) textField.text = @"";
    
    } else if (textField == self.CVVTextField) {
        if (![self.cardType isEqualToString:@"Amex"] && self.CVVNumber.length == 3) {
            self.CVVNumber = [self.CVVNumber substringToIndex:3];
            return NO;
        } else if (self.CVVNumber.length == 4) return NO;
    
    } else if (textField == self.creditCardTextField) {
        if (self.cardNumber.length >= 6 && (!self.cardType)) {
            return NO;
        } else if (([self.cardType isEqualToString:@"Amex"] && self.cardNumber.length == 15 ) || (self.cardNumber.length == 16)) {
            self.cardNumber = [self.cardNumber substringToIndex:self.cardNumber.length];
            [self CVVEnable:YES];
            return NO;
        }
    
    } else if (textField == self.expirationMonthField || textField == self.expirationYearField) {
        if (textField.text.length == 2) return NO;
        
        if (textField == self.expirationMonthField) {
            int maxDigit = 1;
            if (self.expirationMonth.length == 1) {
                if ([string intValue] == 0 && [self.expirationMonth intValue] == 0) return NO;
                maxDigit = ([self.expirationMonth intValue] == 1 ? 2 : 9);
            }
            if ([string intValue] > maxDigit) return NO;
            
        } else if (textField == self.expirationYearField) {
            if (self.expirationYear.length == 2) return NO;
        }
    }
    
    return YES;
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
    if (!self.expirationMonth || !self.expirationYear) return nil;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMyy"];
    NSDate *date = [formatter dateFromString:[[self expirationMonth] stringByAppendingString:[self expirationYear]]];
    NSLog(@"%@", date);
    return date;
}

- (IBAction)editingCVVStarted:(UITextField *)sender
{
    self.cardLogo = [UIImage imageNamed:@"CVV"];
}

- (IBAction)editingCVVEnded:(UITextField *)sender
{
    self.cardType = [CFMCreditCard typeForCreditCardNumber:self.cardNumber];
}

- (void)setExpirationMonth:(NSString *)expirationMonth
{
    self.expirationMonthField.text = expirationMonth;
}

- (NSString *)expirationMonth
{
    return [self.expirationMonthField.text isEqualToString:@""] ? nil : self.expirationMonthField.text;
}

- (void)setExpirationYear:(NSString *)expirationYear
{
    self.expirationYearField.text = expirationYear;
}

- (NSString *)expirationYear
{
    return [self.expirationYearField.text isEqualToString:@""] ? nil : self.expirationYearField.text;
}

- (void)setCVVNumber:(NSString *)CVVNumber {
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

- (void)CVVEnable:(BOOL)condition
{
    self.CVVTextField.enabled = condition;
}

- (void)clearForm
{
    self.cardNumber = @"";
    self.cardType = nil;
    self.CVVNumber = @"";
    self.expirationMonth = @"";
    self.expirationYear = @"";
}

- (void)setFocusOnCreditCardNumber
{
    [self.creditCardTextField becomeFirstResponder];
}

@end
