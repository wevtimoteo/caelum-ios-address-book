//
//  FormContactViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/6/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "FormContactViewController.h"
#import "Contact.h"

@interface FormContactViewController ()

@end

@implementation FormContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveContactData:(id)sender
{
    Contact * contact = [[Contact alloc] init];
    
    contact.name = self.name.text;
    contact.mobile = self.mobile.text;
    contact.email = self.email.text;
    contact.address = self.address.text;
    contact.website = self.website.text;
    
    NSLog(@"Contato adicionado: %@", contact);
    
    [self.view endEditing:YES];
}

- (IBAction)nextField:(id)sender {
}

@end
