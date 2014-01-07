//
//  ListContactsViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "ListContactsViewController.h"
#import "FormContactViewController.h"
#import "Contact.h"

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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void) showContactForm
{
    FormContactViewController * formContact = [[FormContactViewController alloc] init];
    formContact.contacts = self.contacts;
    [self.navigationController pushViewController:formContact animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * pool = @"contacts_pool";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: pool];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: pool];
    }
    
    Contact * contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

@end
