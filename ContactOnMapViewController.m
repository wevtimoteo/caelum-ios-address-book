//
//  ContactOnMapViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/9/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "ContactOnMapViewController.h"

@interface ContactOnMapViewController ()

@end

@implementation ContactOnMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

@end