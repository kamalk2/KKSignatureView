///////////////////////////////////////////////////////////////////////////////////
// License: MIT License
// Developer email: L.Kamal@live.in
//
//
// Class:KKSignatureView.h
//
// Description:
// This library is a subclass of UIView. To use it, just associate this class to a UiView and use its object to access the methods.
//
///////////////////////////////////////////////////////////////////////////////////
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface KKSignatureView : UIView

@property (weak,nonatomic) IBOutlet UILabel * lbl_SignHere;

//*********** Methods *************//

// This method will indicate if the canvas is signed or not.
-(BOOL) hasSignature;

// This method will return the signature image.
- (UIImage*) getSignatureImage;

//This method is used to set the sent image as Signature.
- (void) setSignatureImage:(UIImage *)img;

//Method to set the line stroke color.
- (void)setLineColor:(UIColor *)color;

//Method to set line Width.
- (void)setLineWidth:(CGFloat)width;

//Method to clear the canvas.
- (void)clear;

//Method to clear the canvas with a color.
-(void)clearWithColor:(UIColor *)color;

@end
