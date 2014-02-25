//
//  NSString+HTMLAttributedString.m
//  bookface
//
//  Created by Joshua Dickens on 2/23/14.
//  Copyright (c) 2014 Joshua Dickens. All rights reserved.
//

#import "NSString+HTMLAttributedString.h"

@implementation NSString (HTMLAttributedString)


+ (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML style:(NSString *)style {
    
    
    if(style == nil) {
    UIFont *font = [UIFont systemFontOfSize:14];
    UIFont *boldFont = [UIFont boldSystemFontOfSize:14];
    style =  [NSString stringWithFormat:@"<meta charset=\"UTF-8\"><style> body { font-family: '%@'; font-size: 14px; } p {line-height: 20px; margin-bottom: 0px} b {font-family: '%@' !important; }</style>", font.fontName, boldFont.fontName];
    }
    HTML = [NSString stringWithFormat:@"%@%@", style, HTML];
    
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: @4 };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:nil error:nil];
    
}





@end
