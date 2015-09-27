///////////////////////////////////////////////////////////////////////////////////
// License: MIT License
// email: L.Kamal@live.in
//
// Class:KKSignatureView.m
//
// Description:
// This library is a subclass of UIView. To use it, just associate this class to a UiView and use its object to access the methods.
//
///////////////////////////////////////////////////////////////////////////////////
//

#import "KKSignatureView.h"

static CGPoint midpoint(CGPoint p0, CGPoint p1) {
	return (CGPoint) {
		(p0.x + p1.x) / 2.0,
		(p0.y + p1.y) / 2.0
	};
}

@interface KKSignatureView () {
	
	UIBezierPath *path;
	CGPoint previousPoint;
	
	CGFloat lineWidth;      //Used to locally set the stroke width.
	UIColor * lineColor;    //Used to set line color.
	BOOL isSigned;          //Status of signature.
	
}
@end

@implementation KKSignatureView

- (void)commonInit {
	isSigned = NO;
	
	path = [UIBezierPath bezierPath];
	
	lineWidth = 3;                      // Set default line Width.
	lineColor = [UIColor blueColor];    // Set default line Color.
	
	// Capture touches
	UIPanGestureRecognizer *draw = [[UIPanGestureRecognizer alloc] initWithTarget:self
																		   action:@selector(drawSignature:)];
	draw.maximumNumberOfTouches = draw.minimumNumberOfTouches = 1;
	[self addGestureRecognizer:draw];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) [self commonInit];
	return self;
}
- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) [self commonInit];
	return self;
}

#pragma mark - Signature Drawing Methods
- (void)drawSignature:(UIPanGestureRecognizer *)pan {
	
	self.lbl_SignHere.hidden = YES;
	
	CGPoint currentPoint = [pan locationInView:self];
	CGPoint midPoint = midpoint(previousPoint, currentPoint);
	
	if (pan.state == UIGestureRecognizerStateBegan) {
		[path moveToPoint:currentPoint];
	} else if (pan.state == UIGestureRecognizerStateChanged) {
		[path addQuadCurveToPoint:midPoint controlPoint:previousPoint];
	}
	
	previousPoint = currentPoint;
	
	[self setNeedsDisplay];
	
	isSigned = YES;
}

- (void)drawRect:(CGRect)rect
{
	[lineColor setStroke];      // To set the stroke Color.
	path.lineWidth = lineWidth; // To set the line width.
	[path stroke];
}

#pragma mark - Custom Methods

//Method to clear the canvas.
- (void)clear {
	
	path = nil;
	path = [UIBezierPath bezierPath];
	[self setNeedsDisplay];
	
	self.backgroundColor = [UIColor whiteColor];
	
	self.lbl_SignHere.hidden = NO;
	isSigned = NO;
}

//This method will clear the canvas with the given color.
- (void)clearWithColor:(UIColor *)color {
	
	[self clear];
	
	self.backgroundColor = color;
}

// This method will return the signature image.
- (UIImage*) getSignatureImage{
	
	UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return img;
}

//This method will scale the images based on the size specified.
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
	
	//UIGraphicsBeginImageContext(newSize);
	// In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
	// Pass 1.0 to force exact pixel size.
	UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
	[image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

//This method is used to set the sent image as Signature.
- (void) setSignatureImage:(UIImage *)img {
	
	[self clear];
	
	self.lbl_SignHere.hidden = YES;
	
	//Scale the image to fit the Signature View.
	img=[self imageWithImage:img scaledToSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height)];
	
	self.backgroundColor=[UIColor colorWithPatternImage:img];
	isSigned = YES;
}

//Method to set line Width.
- (void)setLineWidth:(CGFloat)width {
	lineWidth = width;
}

//Method to set the line stroke color.
-(void) setLineColor:(UIColor *)color{
	lineColor = color;
}

// This method will indicate if the canvas is signed or not.
-(BOOL)hasSignature{
	return isSigned;
}


@end
