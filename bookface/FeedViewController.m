//
//  FeedViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/16/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "FeedViewController.h"
#import "NewsPostViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
- (IBAction)onTap:(id)sender;

-(void)showList:(id)sender;
-(void)showSearch:(id)sender;

@end

@implementation FeedViewController

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
    [self.navigationItem setTitle:@"News Feed"];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(showSearch:)];
    UIBarButtonItem *listButton = [[UIBarButtonItem alloc] init];
    listButton.image = [UIImage imageNamed:@"share_btn"]; // TODO Get actual list icon
    
    [self.navigationItem setRightBarButtonItem:listButton];
    [self.navigationItem setLeftBarButtonItem: searchButton];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated  {
//    [self.navigationItem setTitle:@"News Feed"];

}

-(void)showList:(id)sender{

}

-(void)showSearch:(id)sender{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
//    NSLog(@"Did tap on view %@", sender);
//    [self setTitle:@""];
//    [self.navigationItem setTitle:@""];
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil]];
    [self.navigationController pushViewController:[[NewsPostViewController alloc] init] animated:YES   ];
}
@end
