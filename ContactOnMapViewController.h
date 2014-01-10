//
//  ContactOnMapViewController.h
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/9/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Contact.h"

@interface ContactOnMapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, atomic) NSMutableArray * contacts;

@end
