//
//  FeedViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/16/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "FeedViewController.h"
#import "NewsPostViewController.h"
#import "FeedCell.h"
#import "Notification.h"
#import "UIImageView+AFNetworking.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *view;

@property (strong, nonatomic) NSArray *feeddata;

- (IBAction)onTap:(id)sender;

-(void)showList:(id)sender;
-(void)showSearch:(id)sender;

@end

@implementation FeedViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       self.feeddata = [Notification fakeNotifications];
    }
    return self;
}
//
//
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        
//        self.feeddata = [Notification fakeNotifications];
//    }
//    return self;
//}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Notifications"];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(showSearch:)];
    UIBarButtonItem *listButton = [[UIBarButtonItem alloc] init];
    listButton.image = [UIImage imageNamed:@"share_btn"]; // TODO Get actual list icon
    
    [self.navigationItem setRightBarButtonItem:listButton];
    [self.navigationItem setLeftBarButtonItem: searchButton];
    
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil]];

    
//    self.feedTableView.dataSource = self;
//    self.feedTableView.delegate = self;
    
    [[self view] registerNib:[UINib nibWithNibName:@"FeedCell" bundle:nil] forCellReuseIdentifier:@"FeedListCell"];
    
    self.clearsSelectionOnViewWillAppear = YES;
    
    self.view.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    
    
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
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

#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeddata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedCell *cell = (FeedCell *)[tableView dequeueReusableCellWithIdentifier:@"FeedListCell"];
    
    Notification *not = self.feeddata[indexPath.row];
    
    cell.notificationBodyLabel.text = not.body;
    cell.updateTimeLabel.text = not.updatedTime;
    NSURL *imageUrl = [[NSURL alloc] initWithString:not.personImageUrl];
    [cell.personImageView setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"profile_image_placeholder_68@"]];
    return cell;
    
    
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    return
//    
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Notification *not = self.feeddata[indexPath.row];
    NewsPostViewController *postView = [[NewsPostViewController alloc] initWIthNotification:not];
    [self.navigationController pushViewController:postView animated:YES];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"DID DESELECT");
}

#pragma mark - private methods


- (IBAction)onTap:(id)sender {
//    NSLog(@"Did tap on view %@", sender);
//    [self setTitle:@""];
//    [self.navigationItem setTitle:@""];
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil]];
    [self.navigationController pushViewController:[[NewsPostViewController alloc] init] animated:YES   ];
}
@end
