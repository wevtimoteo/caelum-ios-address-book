//
//  ContactOnMapViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/9/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "ContactOnMapViewController.h"
#import "FormContactViewController.h"

@implementation ContactOnMapViewController

# pragma mark - init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];

    if (self) {
        UIImage * img = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:img tag:1];
        self.tabBarItem = item;
    }

    return self;
}

# pragma mark - view

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    MKUserTrackingBarButtonItem * btn = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.map];
    self.navigationItem.leftBarButtonItem = btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.map addAnnotations: self.contacts];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.map removeAnnotations:self.contacts];
}

# pragma mark - ui

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }

    static NSString * pool = @"pool";

    MKPinAnnotationView * pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pool];
    if (!pin) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pool];
    } else {
        pin.annotation = annotation;
    }

    pin.pinColor = MKPinAnnotationColorRed;
    pin.canShowCallout = YES;

    Contact * contact = (Contact *) annotation;

    if (contact.avatar) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 32.0, 32.0)];
        imageView.image = contact.avatar;
        pin.leftCalloutAccessoryView = imageView;
    }

    UIButton * goToContact = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    [goToContact addTarget:self action:@selector(goToContact:) forControlEvents:UIControlEventTouchUpInside];
    pin.rightCalloutAccessoryView = goToContact;

    return pin;
}

- (void)goToContact:(id)sender
{
    FormContactViewController * formContact = [[FormContactViewController alloc] init];
    [self.navigationController pushViewController:formContact animated:YES];
}

@end
