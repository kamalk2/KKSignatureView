KKSignatureView
--

KKSignatureView is an iOS Signature control written in Objective-C.

### Features
   - Draw signatures with ease anywhere in your screen
   - Get and Set Signature images just by calling the instance methods
   - Customize the width and line color of the signature
   - Clear with colors

### Usage
  - Download and include the Source in your project
  - Import QuartzCore.h
  - Add a UIView in your ViewController and assign the class as KKSignatureView
  - Create an IBOutlet and ***Voila!***
  - Use the Custom Class methods to modify the properties and get the signature images.
 
###### Get the Signature Image
``` 
- (UIImage*) getSignatureImage
```

###### Clear Signature Pad
```
- (void)clear;
- (void)clearWithColor:(UIColor *)color;
```
###### Customize
``` 
- (void)setLineColor:(UIColor *)color;
- (void)setLineWidth:(CGFloat)width;
```
###### Check Signature
``` 
- (BOOL) hasSignature;
```

### Screenshots
![screenshot](https://cloud.githubusercontent.com/assets/8474562/10122591/2af1f128-653c-11e5-840b-d66a47c4cbab.png)

License
----
##### The MIT License (MIT)
>Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


**Free Software, Hell Yeah!**



