//
//  Notification.m
//  bookface
//
//  Created by Joshua Dickens on 2/20/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "Notification.h"


@implementation Notification


-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    self.body = dictionary[@"body"];
    self.updatedTime = dictionary[@"updated"];
    self.personImageUrl = dictionary[@"personImageUrl"];
    self.notificationIconName = dictionary[@"notificationIconName"];
    self.personName = dictionary[@"personName"];
    
    
    return self;
}


+ (NSArray *) fakeNotifications {
    NSMutableArray *fakeNotifications = [[NSMutableArray alloc] init];
    
    Notification *not1 = [[Notification alloc] initWithDictionary: @{@"body":@"Joshua Dickens posted a photo",
                           @"updated": @"3 minutes ago",
                           @"personName":@"Joshua Dickens",
                           @"personImageUrl": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/t1/p320x320/1508523_10102622600085209_625927338_n.jpg",
                           @"notificationIconName":@"heart"}];
    
    Notification *not2 = [[Notification alloc] initWithDictionary: @{@"body":@"Chris Connolly posted a photo",
                                                                      @"personName":@"Chris Connolly",
                                                                     @"updated": @"5 minutes ago",
                                                                     @"personImageUrl": @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/t1/p320x320/601968_10151402376036840_1924078178_n.jpg",
                                                                     @"notificationIconName":@"heart"}];
    
    
    [fakeNotifications addObject:not1];
    [fakeNotifications addObject:not2];
    
    
    
    fakeNotifications = [fakeNotifications copy];
    
    return fakeNotifications;
}

@end
