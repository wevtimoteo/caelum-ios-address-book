//
//  ListContactsViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "ListContactsViewController.h"
#import "FormContactViewController.h"

@implementation ListContactsViewController

- (id) init
{
    self = [super init];
    
    if (self) {
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showContactForm)];
        self.navigationItem.rightBarButtonItem = addButton;
    }

    return self;
}

- (void) showContactForm
{
    FormContactViewController * formContact = [[FormContactViewController alloc] init];
    formContact.contacts = self.contacts;
    [self.navigationController pushViewController:formContact animated:YES];
}

@end
