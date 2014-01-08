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

# pragma mark - init

- (id) init
{
    self = [super init];
    
    if (self) {
        self.selectedRow = -1;
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showContactForm)];
        self.navigationItem.rightBarButtonItem = addButton;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }

    return self;
}

# pragma mark - viewLoad

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.selectedRow < -1) {
        return;
    }

    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:self.selectedRow inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void) viewDidLoad
{
    UILongPressGestureRecognizer * longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showActions:)];
    [self.tableView addGestureRecognizer:longGesture];
}

# pragma mark - managing view

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
    FormContactViewController * form = [[FormContactViewController alloc] initWithContact:contact];
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
}

- (void) showActions:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.tableView];
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        Contact * contact = self.contacts[indexPath.row];
        NSLog(@"contact: %@", contact);

        UIActionSheet * actionsList = [[UIActionSheet alloc] initWithTitle:contact.name delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar",@"Enviar e-mail",@"Visualizar site",@"Abrir Mapa", nil];

        [actionsList showInView:self.view];

    }
}

# pragma mark - contact management

- (void) saveContact:(Contact *)contact
{
    [self.contacts addObject:contact];
    self.selectedRow = [self.contacts indexOfObject:contact];
}


- (void) updateContact:(Contact *)contact
{
    self.selectedRow = [self.contacts indexOfObject:contact];
}

@end
