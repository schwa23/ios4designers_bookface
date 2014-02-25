//
//  FeedCell.m
//  bookface
//
//  Created by Joshua Dickens on 2/18/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "FeedCell.h"
#import "Notification.h"
#import "NSString+HTMLAttributedString.h"

@interface FeedCell ()


-(void)setupCellForNotification:(Notification *) notification;

@end

@implementation FeedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellForNotification:(Notification *) notification {
//    @property (weak, nonatomic) IBOutlet UIImageView *personImageView;
//    @property (weak, nonatomic) IBOutlet UILabel *notificationBodyLabel;
//    @property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;
//    @property (weak, nonatomic) IBOutlet UIImageView *notificationIconView;
    
    NSString *bodyHtml = notification.body;
    
    //wrap the thing in a paragraph tag or weird stuff happens.
    bodyHtml = [NSString stringWithFormat:@"<p>%@</p>",bodyHtml];
    
    NSAttributedString *bodyStyled = [NSString attributedStringWithHTML:bodyHtml style:nil];
    
    NSMutableAttributedString *bodyMStyled = [[NSMutableAttributedString alloc] initWithAttributedString:bodyStyled];
   
    [bodyMStyled fixAttributesInRange:NSRangeFromString([NSString stringWithFormat:@"0,%lu",(unsigned long)bodyStyled.string.length])];
    
    self.notificationBodyLabel.attributedText=bodyMStyled;
    
    NSString *iconName = [NSString stringWithFormat:@"icon-%@-16px", notification.notificationIconName];
    
    self.notificationIconView.image = [UIImage imageNamed:iconName];
}


@end
