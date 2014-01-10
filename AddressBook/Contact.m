//
//  Contact.m
//  AddressBook
//
//  Created by Weverton do Couto Timoteo on 1/7/14.
//  Copyright (c) 2014 Weverton do Couto Timoteo. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@dynamic name, mobile, email, address, website, latitude, longitude, avatar;

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ <%@>", self.name, self.email];
}


- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.website = [aDecoder decodeObjectForKey:@"website"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.website forKey:@"website"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

# pragma mark - properties

- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSString *)title
{
    return self.name;
}

- (NSString *)subtitle
{
    return self.address;
}

@end
