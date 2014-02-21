//
//  NewsPostViewController.h
//  bookface
//
//  Created by Joshua Dickens on 2/11/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NewsPostViewController : UIViewController

-(id)initWithTitle:(NSString *)title;
-(id)initWIthNotification:(Notification *)notification;

@end
