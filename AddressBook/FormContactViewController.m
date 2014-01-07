//
//  FormContactViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/6/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "FormContactViewController.h"
#import "Contact.h"

@implementation FormContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        UIBarButtonItem * saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveContactData:)];
        self.navigationItem.rightBarButtonItem = saveButton;
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

- (Contact *)loadContactData
{
    Contact * contact = [[Contact alloc] init];
    
    contact.name = self.name.text;
    contact.mobile = self.mobile.text;
    contact.email = self.email.text;
    contact.address = self.address.text;
    contact.website = self.website.text;
    
    return contact;
}

- (void)saveContactData:(id)sender
{
    Contact * contact = [self loadContactData];
    
    [self.contacts addObject:contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextField:(UITextField *)currentField
{
    NSInteger tag = currentField.tag + 1;
    UIResponder * nextField = [self.view viewWithTag:tag];
    
    if (nextField) {
        [nextField becomeFirstResponder];
    } else {
        [self saveContactData:self];
    }
}

@end
