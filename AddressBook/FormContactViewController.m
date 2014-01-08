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
        UIBarButtonItem * saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addContact:)];
        self.navigationItem.rightBarButtonItem = saveButton;
    }
    
    return self;
}

- (id)initWithContact:(Contact *) contact
{
    self = [super init];
    if (self) {
        self.contact = contact;
        self.navigationItem.title = @"Alteração";
        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithTitle:@"Altera" style:UIBarButtonItemStylePlain target:self action:@selector(updateContact)];
        self.navigationItem.rightBarButtonItem = editButton;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.contact) {
        self.name.text = self.contact.name;
        self.mobile.text = self.contact.mobile;
        self.email.text = self.contact.email;
        self.address.text = self.contact.address;
        self.website.text = self.contact.website;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Contact *)loadContactData
{
    if (!self.contact) {
        self.contact = [[Contact alloc] init];
    }
    
    self.contact.name = self.name.text;
    self.contact.mobile = self.mobile.text;
    self.contact.email = self.email.text;
    self.contact.address = self.address.text;
    self.contact.website = self.website.text;
    
    return self.contact;
}

- (void)addContact:(id)sender
{
    Contact * contact = [self loadContactData];
    
    [self.delegate saveContact: contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateContact:(id)sender
{
    [self loadContactData];
    
    if ([self.delegate respondsToSelector:@selector(updateContact:)]) {
        [self.delegate updateContact: self.contact];
    }

    [self.delegate updateContact: self.contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextField:(UITextField *)currentField
{
    NSInteger tag = currentField.tag + 1;
    UIResponder * nextField = [self.view viewWithTag:tag];
    
    if (nextField) {
        [nextField becomeFirstResponder];
    } else {
        [self addContact:self];
    }
}

@end
