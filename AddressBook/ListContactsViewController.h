//
//  ListContactsViewController.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ListContactsViewController : UITableViewController

@property (weak, atomic) NSMutableArray * contacts;

- (void) showContactForm;
- (void) saveContact:(Contact *) contact;

@end
