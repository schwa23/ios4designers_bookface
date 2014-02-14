//
//  PostContentViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/13/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "PostContentViewController.h"

@interface PostContentViewController ()
@property (weak, nonatomic) IBOutlet UIView *postContentView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *postBody;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;

@end

@implementation PostContentViewController

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
    CGRect viewFrame = self.postContentView.frame;
//    viewFrame.size.width = viewFrame.size.width;
//    viewFrame.size.height = viewFrame.size.height - 20;
    viewFrame.origin.x -= 10;
    viewFrame.origin.y -= 20;
    
    /// customize the post container view
    UIView *postBackground = [[UIView alloc] initWithFrame: viewFrame];
    postBackground.layer.cornerRadius = 2.5f;
    postBackground.layer.shadowColor = [UIColor blackColor].CGColor;
    postBackground.layer.shadowOffset = CGSizeMake(0, 0);
    postBackground.layer.shadowOpacity = .05;
    postBackground.layer.shadowRadius = 1.5;
    postBackground.layer.borderWidth = .5f;
    postBackground.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:.25].CGColor;
    postBackground.backgroundColor = [UIColor whiteColor];
    [self.postContentView insertSubview:postBackground atIndex:0];
    
    [self.postBody sizeToFit];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
