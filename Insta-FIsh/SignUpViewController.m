//
//  SignUpViewController.m
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.usernameTextField) {
        self.usernameTextField.keyboardType = UIKeyboardTypeEmailAddress;
        self.usernameTextField.autocapitalizationType = UITextAutocorrectionTypeNo;
    } else {
        self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
        self.passwordTextField.autocapitalizationType = UITextAutocorrectionTypeNo;
        self.passwordTextField.secureTextEntry = YES;
    }

}

@end
