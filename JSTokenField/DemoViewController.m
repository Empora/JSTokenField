//
//	Copyright 2011 James Addyman (JamSoft). All rights reserved.
//	
//	Redistribution and use in source and binary forms, with or without modification, are
//	permitted provided that the following conditions are met:
//	
//		1. Redistributions of source code must retain the above copyright notice, this list of
//			conditions and the following disclaimer.
//
//		2. Redistributions in binary form must reproduce the above copyright notice, this list
//			of conditions and the following disclaimer in the documentation and/or other materials
//			provided with the distribution.
//
//	THIS SOFTWARE IS PROVIDED BY JAMES ADDYMAN (JAMSOFT) ``AS IS'' AND ANY EXPRESS OR IMPLIED
//	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//	FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JAMES ADDYMAN (JAMSOFT) OR
//	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//	ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//	The views and conclusions contained in the software and documentation are those of the
//	authors and should not be interpreted as representing official policies, either expressed
//	or implied, of James Addyman (JamSoft).
//

#import "DemoViewController.h"
#import "JSTokenField.h"

@interface DemoViewController ()

@property (nonatomic, strong) NSMutableArray *toRecipients;
@property (nonatomic, strong) JSTokenField *toField;

@end

@implementation DemoViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.toRecipients = [[NSMutableArray alloc] init];
	
	self.toField = [[JSTokenField alloc] initWithFrame:CGRectMake(0, 0, 320, 31)];
    self.toField.showDeleteButtons = YES;
	[[self.toField label] setText:@"To:"];
	[self.toField setDelegate:self];
	[self.view addSubview:self.toField];
    
    UIView *separator1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.toField.bounds.size.height-1, self.toField.bounds.size.width, 1)];
    [separator1 setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self.toField addSubview:separator1];
    [separator1 setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark -
#pragma mark JSTokenFieldDelegate

- (void)tokenField:(JSTokenField *)tokenField didAddToken:(NSString *)title representedObject:(id)obj
{
	NSDictionary *recipient = [NSDictionary dictionaryWithObject:obj forKey:title];
	[self.toRecipients addObject:recipient];
	NSLog(@"Added token for < %@ : %@ >\n%@", title, obj, self.toRecipients);

}

- (void)tokenField:(JSTokenField *)tokenField didRemoveTokenAtIndex:(NSUInteger)index
{	
	[self.toRecipients removeObjectAtIndex:index];
	NSLog(@"Deleted token %tu\n%@", index, self.toRecipients);
}

- (BOOL)tokenFieldShouldReturn:(JSTokenField *)tokenField {
    NSMutableString *recipient = [NSMutableString string];
	
	NSMutableCharacterSet *charSet = [[NSCharacterSet whitespaceCharacterSet] mutableCopy];
	[charSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
	
    NSString *rawStr = [[tokenField textField] text];
	for (int i = 0; i < [rawStr length]; i++)
	{
		if (![charSet characterIsMember:[rawStr characterAtIndex:i]])
		{
			[recipient appendFormat:@"%@",[NSString stringWithFormat:@"%c", [rawStr characterAtIndex:i]]];
		}
	}
    
    if ([rawStr length])
	{
		[tokenField addTokenWithTitle:rawStr representedObject:recipient];
	}
    
    [[tokenField textField] setText:@""];
    
    return NO;
}

@end
