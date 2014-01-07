//
//  FormContactViewController.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/6/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormContactViewController : UIViewController

@property (weak,nonatomic) IBOutlet UITextField *name;
@property (weak,nonatomic) IBOutlet UITextField *mobile;
@property (weak,nonatomic) IBOutlet UITextField *email;
@property (weak,nonatomic) IBOutlet UITextField *address;
@property (weak,nonatomic) IBOutlet UITextField *website;

- (IBAction)saveContactData:(id)sender;

@end