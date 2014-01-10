//
//  FormContactViewController.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/6/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "FormContactViewController.h"
#import "Contact.h"

#import <CoreLocation/CoreLocation.h>

@implementation FormContactViewController

#pragma mark - init

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
        UIBarButtonItem * saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addContact:)];
        self.navigationItem.rightBarButtonItem = saveButton;
    }
    
    return self;
}

- (id)initWithContact:(Contact *) contact
{
    self = [super init];
    if (self) {
        self.contact = contact;
        self.navigationItem.title = @"Alteração";
        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithTitle:@"Altera" style:UIBarButtonItemStylePlain target:self action:@selector(updateContact:)];
        self.navigationItem.rightBarButtonItem = editButton;
    }
    
    return self;
}

#pragma mark - load

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.contact) {
        self.name.text = self.contact.name;
        self.mobile.text = self.contact.mobile;
        self.email.text = self.contact.email;
        self.address.text = self.contact.address;
        self.website.text = self.contact.website;
        self.latitude.text = [self.contact.latitude stringValue];
        self.longitude.text = [self.contact.longitude stringValue];

        if (self.contact.avatar) {
            [self.btnAvatar setBackgroundImage:self.contact.avatar forState:UIControlStateNormal];
            [self.btnAvatar setTitle:nil forState:UIControlStateNormal];
        }

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Contact *)loadContactData
{
    if (!self.contact) {
        self.contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:self.context];
    }
    
    self.contact.name = self.name.text;
    self.contact.mobile = self.mobile.text;
    self.contact.email = self.email.text;
    self.contact.address = self.address.text;
    self.contact.website = self.website.text;
    self.contact.avatar = [self.btnAvatar backgroundImageForState:UIControlStateNormal];

    self.contact.latitude = [NSNumber numberWithDouble:[self.latitude.text doubleValue]];
    self.contact.longitude = [NSNumber numberWithDouble:[self.longitude.text doubleValue]];

    NSLog(@"Avatar do contato: %@", self.contact.avatar);
    
    return self.contact;
}

#pragma mark - contact

- (void)addContact:(id)sender
{
    Contact * contact = [self loadContactData];
    
    [self.delegate saveContact: contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateContact:(id)sender
{
    [self loadContactData];
    
    if ([self.delegate respondsToSelector:@selector(updateContact:)]) {
        [self.delegate updateContact: self.contact];
    }

    [self.delegate updateContact: self.contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark - delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * image = info[UIImagePickerControllerEditedImage];
    [self.btnAvatar setBackgroundImage:image forState:UIControlStateNormal];
    [self.btnAvatar setTitle:nil forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - ux

- (IBAction)nextField:(UITextField *)currentField
{
    NSInteger tag = currentField.tag + 1;
    UIResponder * nextField = [self.view viewWithTag:tag];
    
    if (nextField) {
        [nextField becomeFirstResponder];
    } else {
        [self addContact:self];
    }
}

- (IBAction)selectAvatar:(id)sender
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Não foi possível alterar o avatar" message:@"Precisamos do acesso à suas fotos ou da galeria para mudar seu avatar" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Tentar novamente", nil] show];
    }
}

- (IBAction)searchCoordinates:(UIButton *)sender
{
    [self.loading startAnimating];
    sender.hidden = YES;
    CLGeocoder *gc = [[CLGeocoder alloc] init];

    [gc geocodeAddressString:self.address.text completionHandler:^(NSArray * results, NSError * error)
    {
        if (!error && [results count] > 0) {
            CLPlacemark * result = results[0];
            CLLocationCoordinate2D coordinate = result.location.coordinate;
            self.latitude.text = [NSString stringWithFormat:@"%f", coordinate.latitude];
            self.longitude.text = [NSString stringWithFormat:@"%f", coordinate.longitude];
        }
        [self.loading stopAnimating];
        sender.hidden = NO;
    }];
}

@end
