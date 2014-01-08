//
//  FormContactViewControllerDelegate.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/8/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

@protocol FormContactViewControllerDelegate <NSObject>


- (void) saveContact:(Contact *) newContact;

@optional
- (void) updateContact:(Contact *) contact;

@end