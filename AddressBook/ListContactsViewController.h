//
//  ListContactsViewController.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

#import "FormContactViewControllerDelegate.h"

@interface ListContactsViewController : UITableViewController <FormContactViewControllerDelegate, UIActionSheetDelegate> {
    Contact * selectedContact;
}

@property (weak, atomic) NSMutableArray * contacts;
@property (assign) NSInteger selectedRow;

- (void) showContactForm;

@end
