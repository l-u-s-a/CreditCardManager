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
    
    if (textField.text.length == 6 && [cardType isEqualToString:@"GenericCard"] && ![string isEqualToString:@""]) {
        textField.text = [textField.text substringToIndex:6];
        return NO;
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



@end
