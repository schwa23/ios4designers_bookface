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
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    //this seems hacky. Couldn't get
    //    [NSBundle mainBundle] pathForResource:ofType:
    // to return anything
    
    NSString *filePath = [path stringByAppendingString:@"/notification_fixtures.js"];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    for (NSDictionary *dict in array) {
        [fakeNotifications addObject:[[Notification alloc] initWithDictionary:dict]];
    }
    fakeNotifications = [fakeNotifications copy];
    return fakeNotifications;
}

@end
