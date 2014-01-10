//
//  Contact.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Contact : NSManagedObject <NSCoding,MKAnnotation>

@property NSString *name;
@property NSString *mobile;
@property NSString *email;
@property NSString *address;
@property NSString *website;
@property (strong,atomic) UIImage * avatar;
@property (strong,atomic) NSNumber * latitude;
@property (strong,atomic) NSNumber * longitude;

@end
