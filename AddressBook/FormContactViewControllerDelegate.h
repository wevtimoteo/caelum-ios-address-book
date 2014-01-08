//
//  FormContactViewControllerDelegate.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/8/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

@protocol FormContactViewControllerDelegate

- (void) saveContact:(Contact *) newContact;
- (void) updateContact:(Contact *) contact;

@end