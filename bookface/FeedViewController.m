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

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

@property (strong, nonatomic) NSArray *feeddata;

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
        
        self.feeddata = @[
                          @{@"image": @"image1", @"body":@"foobar", @"message":@"Hi there"},
                           @{@"image": @"image2", @"body":@"barzap", @"message":@"Hi what"},
                           @{@"image": @"image3", @"body":@"wah", @"message":@"Hi whozit"},
                           @{@"image": @"image4", @"body":@"eek", @"message":@"Hi whenzit"}
                            
                            
                            ];
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
    
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil]];

    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    [[self feedTableView] registerNib:[UINib nibWithNibName:@"FeedCell" bundle:nil] forCellReuseIdentifier:@"FeedListCell"];

    
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

#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeddata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    FeedCell *cell = (FeedCell *)[tableView dequeueReusableCellWithIdentifier:@"FeedListCell"];
    
    
    NSString *body = self.feeddata[indexPath.row][@"body"];
    
    cell.textLabel.text = body;
    return cell;
    
    
}



//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    return
//    
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsPostViewController *postView = [[NewsPostViewController alloc] initWithTitle:(self.feeddata[indexPath.row][@"body"])];
    [self.navigationController pushViewController:postView animated:YES];
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
