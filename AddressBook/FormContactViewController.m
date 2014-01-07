//
//  FormContactViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/6/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "FormContactViewController.h"

@interface FormContactViewController ()

@end

@implementation FormContactViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveContactData:(id)sender
{
    NSMutableDictionary * contact = [[NSMutableDictionary alloc] init];
    [contact setObject:self.name.text forKey:@"name"];
    [contact setObject:self.mobile.text forKey:@"mobile"];
    [contact setObject:self.email.text forKey:@"email"];
    [contact setObject:self.address.text forKey:@"address"];
    [contact setObject:self.website.text forKey:@"website"];
     
     NSLog(@"Contato adicionado: %@", contact);
}

@end
