//
//  ViewController.m
//  KKSignatureView
//
//  Created by Kamal Kumar Lakshmanan on 27/09/15.
//  Copyright (c) 2015 Kamal Kumar Lakshmanan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
	UIImage * signImage;
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clearButtonClicked:(id)sender {
	
	[self.signatureView clear];
}

- (IBAction)setImageClicked:(id)sender {
	
	if (signImage != nil) {
		
		[self.signatureView setSignatureImage:signImage];
	}
	else {
		UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error"
														message:@"No Signature present to set. Sign first; click on get sign and then set image."
													   delegate:self
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
	}
}

- (IBAction)getSignClicked:(id)sender {
	
	if ([self.signatureView hasSignature]) {
		
		signImage = [self.signatureView getSignatureImage];
	}
	else {
		UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error"
														message:@"Please sign in the canvas."
													   delegate:self
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert show];
	}
	
}

- (IBAction)clearWithColorClicked:(id)sender {
	
	[self.signatureView clearWithColor:[self randomColor]];
}

-(UIColor *)randomColor
{
	float red = arc4random() % 255 / 255.0;
	float green = arc4random() % 255 / 255.0;
	float blue = arc4random() % 255 / 255.0;
	UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
	return color;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
