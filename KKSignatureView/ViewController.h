//
//  ViewController.h
//  KKSignatureView
//
//  Created by Kamal Kumar Lakshmanan on 27/09/15.
//  Copyright (c) 2015 Kamal Kumar Lakshmanan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKSignatureView.h"


@interface ViewController : UIViewController

//UIView
@property (weak,nonatomic) IBOutlet KKSignatureView * signatureView;

- (IBAction)clearWithColorClicked:(id)sender;
- (IBAction)clearButtonClicked:(id)sender;
- (IBAction)setImageClicked:(id)sender;
- (IBAction)getSignClicked:(id)sender;


@end

