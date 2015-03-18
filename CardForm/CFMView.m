//
//  CFMView.m
//  CardForm
//
//  Created by Luka Usalj on 18/03/15.
//  Copyright (c) 2015 Luka Usalj. All rights reserved.
//

#import "CFMView.h"

@interface CFMView()
@property (strong, nonatomic) CFMViewController *controller;
@property (strong, nonatomic) IBOutlet UITextField *creditCardTextField;
@property (strong, nonatomic) IBOutlet UITextField *expirationDateTextField;
@property (strong, nonatomic) IBOutlet UITextField *CVVTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creditCardImageView;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation CFMView

- (IBAction)onCreditCardNumberChanged:(UITextField *)sender {
    NSString *creditCardNumber = sender.text;
    [self.controller onCreditCardNumberChanged:creditCardNumber];
}

- (void)setController:(CFMViewController *)controller
{
    _controller = controller;
}

@end
