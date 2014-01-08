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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
    formContact.delegate = self;
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

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex: indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Contact * contact = self.contacts[sourceIndexPath.row];
    [self.contacts removeObjectAtIndex:sourceIndexPath.row];
    [self.contacts insertObject:contact atIndex:destinationIndexPath.row];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact * contact = self.contacts[indexPath.row];
    FormContactViewController * form = [[FormContactViewController alloc] init];
    form.contact = contact;
    [self.navigationController pushViewController:form animated:YES];
}

- (void) saveContact:(Contact *)contact
{
    [self.contacts addObject:contact];
}

-(void) updateContact:(Contact *)contact
{
    NSLog(@"Contato alterado: %@", contact);
}

@end
