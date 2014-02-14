//
//  NewsPostViewController.m
//  bookface
//
//  Created by Joshua Dickens on 2/11/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "NewsPostViewController.h"
#import "PostContentViewController.h"

@interface NewsPostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tabbar;
@property (weak, nonatomic) IBOutlet UIToolbar *commentToolbar;
@property (weak, nonatomic) UITextField *commentField;


- (IBAction)onTap:(id)sender;


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
    [self registerForKeyboardNotifications];
    
    PostContentViewController *postContentVC = [[PostContentViewController alloc] init];
    
    [self addChildViewController:postContentVC];
    [self.view insertSubview:postContentVC.view atIndex:0];
    [postContentVC didMoveToParentViewController:self];
    
    
    UIToolbar *cbar = self.commentToolbar;
    
    //create a text field and add it to the toolbar as a bar button item
    UITextField *commentField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 220, 32)];
    commentField.borderStyle = UITextBorderStyleRoundedRect;
    commentField.background = [[UIImage alloc] initWithContentsOfFile:@"textfieldBackground"];
    commentField.placeholder = @"Write a comment…";
    self.commentField = commentField;
    UIBarButtonItem *customFieldView = [[UIBarButtonItem alloc] initWithCustomView:commentField];
    
    SEL postsel = @selector(postComment:);
    
    UIBarButtonItem *postButton;
    postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                  style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:postsel
                  ];
    
    
    [commentField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [postButton setEnabled:NO];
    [cbar setItems:@[customFieldView, postButton] animated:YES];
    
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onTap:(id)sender {
    [self.commentField endEditing:YES];
}

- (void)postComment:(id)sender {
    
    //post the comment and clear the text field.
    [self.commentField endEditing:YES];
    [self.commentField setText:@""];
    [self textFieldDidChange:self];

}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}


#pragma keyboard stuff

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
    // Your app might not need or want this behavior.
    
    CGRect aRect = self.commentToolbar.frame;
    _originalFrame = aRect;
    
    aRect.origin.y = self.view.frame.size.height - kbSize.height - aRect.size.height;
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
    
    //alternate: use a custome spring
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
    
    
    [UIView animateWithDuration:animationDuration - 0.1
                          delay:0
                        options:(animationCurve<<16)
                     animations:^{
                         self.commentToolbar.frame = _originalFrame;
                     }
                     completion:^(BOOL completed) {
                         [self didFinishAnimatingField];
                     }
     ];
}
@end
