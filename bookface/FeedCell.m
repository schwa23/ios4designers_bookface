//
//  FeedCell.m
//  bookface
//
//  Created by Joshua Dickens on 2/18/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "FeedCell.h"

@interface FeedCell ()

@property (weak, nonatomic) UILabel* bodyLabel;

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

@end
