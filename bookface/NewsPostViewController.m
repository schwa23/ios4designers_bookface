//
//  NewsPostViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/11/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "NewsPostViewController.h"

@interface NewsPostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *navbar;
@property (weak, nonatomic) IBOutlet UIView *postContainer;
@property (weak, nonatomic) IBOutlet UIImageView *commentBar;
@property (weak, nonatomic) IBOutlet UIImageView *tabbar;
@property (weak, nonatomic) IBOutlet UIView *postContent;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;


@end

@implementation NewsPostViewController

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
    
    /// customize the post container view
    UIView *post = self.postContent;
    post.layer.cornerRadius = 2.5f;
    post.layer.shadowColor = [UIColor blackColor].CGColor;
    post.layer.shadowOffset = CGSizeMake(0, 0);
    post.layer.shadowOpacity = .05;
    post.layer.shadowRadius = 1.5;
    post.layer.borderWidth = .5f;
    post.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:.25].CGColor;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
