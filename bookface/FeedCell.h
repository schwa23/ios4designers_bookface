//
//  FeedCell.h
//  bookface
//
//  Created by Joshua Dickens on 2/18/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UILabel *notificationBodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *notificationIconView;

@end
