//
//  NSString+HTMLAttributedString.h
//  bookface
//
//  Created by Joshua Dickens on 2/23/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTMLAttributedString)


+ (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML style:(NSString *)style;

@end
