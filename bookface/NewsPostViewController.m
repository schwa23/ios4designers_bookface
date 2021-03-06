//
//  NewsPostViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/11/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "NewsPostViewController.h"
#import "Notification.h"
#import "NSString+HTMLAttributedString.h"


@interface NewsPostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tabbar;
@property (weak, nonatomic) IBOutlet UIToolbar *commentToolbar;
@property (weak, nonatomic) UITextField *commentField;
@property (weak, nonatomic) IBOutlet UIView *postContentView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *postBody;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedTimeLabel;

@property (strong, nonatomic) NSString* updatedTime;


@property (weak, nonatomic) IBOutlet UIView *postActionsBar;

@property (weak, nonatomic) IBOutlet UIButton *postLikeBtn;
@property (weak, nonatomic) IBOutlet UIButton *postCommentBtn;
@property (weak, nonatomic) IBOutlet UIButton *postShareBtn;

@property (weak,nonatomic) NSString *title;
@property (strong, nonatomic)NSDictionary *postData;


@property(nonatomic) BOOL isPostLiked;


- (IBAction)onTap:(id)sender;
- (IBAction)onLikeButtonTap:(id)sender;
- (IBAction)onCommentButtonTap:(id)sender;
- (IBAction)onShareButtonTap:(id)sender;


-(void)submitComment:(id)sender;
-(void)sharePost:(id)sender;

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

-(id)initWithTitle:(NSString *)title {
    self = [super initWithNibName:nil bundle:nil];

    if (self) {
        self.title = title;
        
    }
    return self;
}


-(id)initWithNotification:(Notification *)notification {
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.title = notification.body;
        self.updatedTime = notification.updatedTime;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
    
    [self initPostContentView];
    
    self.postTitleLabel.text = self.title;
    
    self.postTitleLabel.attributedText = [NSString attributedStringWithHTML:self.title style:nil];
    self.updatedTimeLabel.text = self.updatedTime;
    
    
    UIToolbar *cbar = self.commentToolbar;
    
    //create a text field and add it to the toolbar as a bar button item
    UITextField *commentField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 240, 32)];
    commentField.borderStyle = UITextBorderStyleRoundedRect;
    [commentField setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    commentField.placeholder = @"Write a comment…";
    self.commentField = commentField;
    UIBarButtonItem *customFieldView = [[UIBarButtonItem alloc] initWithCustomView:commentField];
    
    SEL postsel = @selector(submitComment:);
    
    UIBarButtonItem *postButton;
    postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                  style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:postsel
                  ];
    [postButton setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
    
    [commentField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [postButton setEnabled:NO];
    
    //positin the comment bar above the tab bar
    CGRect commentbarFrame = self.commentToolbar.frame;
    CGRect tabbarFrame = self.tabBarController.tabBar.frame;
    commentbarFrame.origin = CGPointMake(commentbarFrame.origin.x, tabbarFrame.origin.y - commentbarFrame.size.height);
    
    
    
//     commentbarFrame= CGRectMake(commentbarFrame.origin.x, self.view.frame.size.height - commentbarFrame.size.height - self.bottomLayoutGuide.length,commentbarFrame.size.width, commentbarFrame.size.height);
    
    self.commentToolbar.frame = commentbarFrame;
//    [self.commentToolbar setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    NSLog(@"Comment bar.frame.origin.y %f", commentbarFrame.origin.y);

    
    
//    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(addImage:) ];
//    ]
    
    [cbar setItems:@[customFieldView, postButton] animated:YES];
    
    
    UIImage *postActionBg = [UIImage imageNamed:@"bar_bg_rpt"];
    
    self.postActionsBar.backgroundColor = [UIColor colorWithPatternImage:postActionBg];
    
    
    //make sure the like button gets the right bg image in both states
    [self.postLikeBtn setBackgroundImage:[UIImage imageNamed:@"bar_bg_rpt_highlight"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    
    //add a share button to the navbar
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(sharePost:)];
    [self.navigationItem setRightBarButtonItem:shareButton animated:YES];
    
    
//    //clear the back button title
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
//    [backButton setTitle:@"oof"];
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self.navigationController action:nil];
//    
//    [self.navigationItem setBackBarButtonItem:backButton];
//    self.navigationItem.backBarButtonItem = backButton; //clear the title in the back button
    
    
    [self setTitle:@"Post"];
}

-(void)initPostContentView {
    
    //create a background view image  for the shadow and white bgcolor
    CGRect viewFrame = self.postContentView.frame;
    //    viewFrame.size.width = viewFrame.size.width;
//    //    viewFrame.size.height = viewFrame.size.height - 20;

    viewFrame.origin.x = -.5;
    viewFrame.origin.y = -.5;
    viewFrame.size.width += 1;
    viewFrame.size.height += 1;
    
    /// customize the post container view
    UIView *postBackground = [[UIView alloc] initWithFrame: viewFrame];
    postBackground.layer.cornerRadius = 2.5f;
    postBackground.layer.shadowColor = [UIColor blackColor].CGColor;
    postBackground.layer.shadowOffset = CGSizeMake(0, 0);
    postBackground.layer.shadowOpacity = .05;
    postBackground.layer.shadowRadius = 1.5;
    postBackground.layer.borderWidth = .5f;
    postBackground.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:.25].CGColor;
    postBackground.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    [self.postContentView insertSubview:postBackground atIndex:0];
    self.postContentView.backgroundColor = [UIColor clearColor];
    [self.postBody sizeToFit];
    
    
    UIImageView *postImage = self.postImage;

    [postImage.layer setShadowPath:[[UIBezierPath
                               bezierPathWithRect:postImage.bounds] CGPath]];
    [self applyStandardShadowToLayer:postImage.layer];

    
}

     -(void) applyStandardShadowToLayer:(CALayer*)layer {
    
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowOpacity = .35;
    layer.shadowRadius = 1.5;
   
    
    
}

-(void)viewWillAppear:(BOOL)animated {

 
}

-(void)textFieldDidChange:(id)sender{
 
    if(![self.commentField.text  isEqual: @""] ) {
        [self.commentToolbar.items[1] setEnabled:YES];
    } else {
        [self.commentToolbar.items[1] setEnabled:NO];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCommentButtonTap:(id)sender {
    [self.commentField becomeFirstResponder];
}

- (IBAction)onShareButtonTap:(id)sender {
    [self sharePost:sender];
}

- (IBAction)onTap:(id)sender {
    
    [self.commentField endEditing:YES];
}

- (IBAction)onLikeButtonTap:(id)sender {
    
        self.postLikeBtn.selected = !self.isPostLiked;
        self.isPostLiked = !self.isPostLiked;
}

- (void)submitComment:(id)sender {
    
    //post the comment and clear the text field.
    [self.commentField endEditing:YES];
    [self.commentField setText:@""];
    [self textFieldDidChange:self];

}

-(void)sharePost:(id)sender {
    
    UIAlertView *shareDialog = [[UIAlertView alloc] initWithTitle:@"Share Post" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Share to Timeline",@"Post to Twitter",@"Save to Reading List", nil];
    
    [shareDialog show];
    
    NSLog(@"share button tapped");
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Clicked button: %@", [alertView buttonTitleAtIndex:buttonIndex]);
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
}


#pragma mark - keyboard stuff

CGRect _originalFrame;

// Called when the UIKeyboardWillShowNotification is sent.
- (void)keyboardWillBeShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    
    //http://stackoverflow.com/questions/18957476/ios-7-keyboard-animation
    
    NSNumber *curveValue = info[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    
    CGRect aRect = self.commentToolbar.frame;
    _originalFrame = aRect;
    
    aRect.origin.y = self.view.frame.size.height - kbSize.height - aRect.size.height;
    NSLog(@"/// willbeshown: commentbar.origin.y %f", aRect.origin.y);
    
    [UIView animateWithDuration:(animationDuration - .05f)
                          delay:.05f
                        options:(animationCurve<<16) //convert to enum
                     animations:^{
                         self.commentToolbar.frame = aRect;
                     }
                     completion:^(BOOL completed) {
                         [self didFinishAnimatingField];
                     }
     ];
    
    //alternate: use a custom spring
    //    [UIView animateWithDuration:.45f
    //                          delay:0.05
    //         usingSpringWithDamping:500.0f
    //          initialSpringVelocity:0.0f
    //                        options:UIViewAnimationOptionCurveLinear
    //                     animations:^{
    //                         self.commentToolbar.frame = aRect;
    //                     }
    //                     completion:^(BOOL completed) {
    //                         [self didFinishAnimatingField];
    //                     }
    //     ];

    
}

- (void)didFinishAnimatingField
{
    //do stuff here when we're done
}

- (void)animateFieldwithKeyboardState:(BOOL)keyboardState {
    

}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
   
    NSNumber *curveValue = info[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    CGRect curFrame =self.commentToolbar.frame;
    
    curFrame =    CGRectMake(curFrame.origin.x, self.view.frame.size.height - curFrame.size.height - self.bottomLayoutGuide.length,curFrame.size.width, curFrame.size.height);
    
    
    
    [UIView animateWithDuration:animationDuration - 0.1
                          delay:0
                        options:(animationCurve<<16)
                     animations:^{
                         self.commentToolbar.frame = curFrame ;
                     }
                     completion:^(BOOL completed) {
                         [self didFinishAnimatingField];
                     }
     ];
}

-(void)keyboardWasHidden:(NSNotification*)aNotification {
    
    

}
@end
