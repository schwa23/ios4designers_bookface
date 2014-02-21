//
//  Notification.h
//  bookface
//
//  Created by Joshua Dickens on 2/20/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *updatedTime;
@property (strong, nonatomic) NSString *notificationIconName;
@property (strong, nonatomic) NSString *personImageUrl;
@property (strong, nonatomic) NSString *personName;


-(id)initWithDictionary:(NSDictionary *)dictionary;


+ (NSArray *) fakeNotifications;
@end
