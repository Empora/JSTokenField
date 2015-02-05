//
//  JSBackspaceReportingTextField.m
//  JSTokenField
//
//  Created by BJ Homer on 2/18/13.
//  Copyright (c) 2013 JamSoft. All rights reserved.
//

#import "JSBackspaceReportingTextField.h"

@implementation JSBackspaceReportingTextField

- (void)insertText:(NSString *)text
{
    [super insertText:text];
}

- (BOOL)keyboardInputShouldDelete:(UITextField *)textField
{
    if (self.text.length == 0) {
        if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            [self.delegate textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
        }
    }
    
    return YES;
}

- (CGRect) rightViewRectForBounds:(CGRect)bounds{
    CGRect textRect = [super rightViewRectForBounds:bounds];
    textRect.origin.x -= self.insets.right;
    return textRect;
}

- (CGRect) leftViewRectForBounds:(CGRect)bounds{
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += self.insets.left;
    return textRect;
}


@end
