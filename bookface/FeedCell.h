//
//  FeedCell.h
//  bookface
//
//  Created by Joshua Dickens on 2/18/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface FeedCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *personImageView;
@property (strong, nonatomic) IBOutlet UILabel *notificationBodyLabel;
@property (strong, nonatomic) IBOutlet UILabel *updateTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *notificationIconView;

-(void)setupCellForNotification:(Notification *) notification;


@end
