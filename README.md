# ToggleView
==========
ToggleView is easy-to-use original toggle button.  
(see sample Xcode project in /Sample)
![toggleView_design1](http://f.cl.ly/items/0q0B422z3f1V3d2z1M3q/toggleView_design1.png)  

##Requirements
iOS 5.1 later

##Installing
By using CocoaPods

```
pod 'ToggleView', '~> 0.0.1'
```

##Usage
Import header

```
#import "ToggleView.h"
```
and set Protocol 'ToggleViewDelegate' at header file.

```
@interface SampleViewController : UIViewController <ToggleViewDelegate>
```
you also add ToggleViewDelegate Methods at source file.

```
#pragma mark - ToggleViewDelegate

- (void)selectLeftButton
{
    NSLog(@"LeftButton Selected");
}

- (void)selectRightButton
{
    NSLog(@"RightButton Selected");
}
```


##Elements of UI parts
There are main elements of UI parts in this library.

- ToggleView
- ToggleButton
- ToggleBase

There parts could change theirs images as you like.


##Type of ToggleView
Currently we have **two** types of ToggleView.

### ToggleViewTypeWithLabel
This ToggleView type has both side labels and enable to tap.

```objectivec
toggleViewWithLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeWithLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
toggleViewWithLabel.toggleDelegate = self;
```
### toggleViewType:ToggleViewTypeNoLabel
This ToggleView type has no label.

```objectivec
toggleViewWithoutLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];  
toggleViewWithoutLabel.toggleDelegate = self;
```

##Type of ToggleBase
also you could change background image.

### ToggleBaseTypeChangeImage
This `ToggleBase type` could change background image of toggle base when you change side you selected.

```objectivec
toggleViewBaseChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
toggleViewBaseChange.toggleDelegate = self;
```
You set the image of both.

**ToggleBase.m**

```objectivec
//change base image option
NSString *const TOGGLE_BASE_IMAGE_L     = @"toggle_base_l.png";
NSString *const TOGGLE_BASE_IMAGE_R     = @"toggle_base_r.png";
```

## Type of ToggleButton
of course you could change button image. 

### ToggleButtonTypeChangeImage
This `ToggleButton type` could change button image when you change side you selected.

```objectivec
toggleViewButtonChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeChangeImage];
toggleViewButtonChange.toggleDelegate = self;
```

**ToggleButton.m**

```objectivec
//change button image option
NSString *const TOGGLE_BUTTON_IMAGE_L    = @"toggle_button_l.png";
NSString *const TOGGLE_BUTTON_IMAGE_R    = @"toggle_button_r.png";
```

##Notice of designing button.
You should create the transparent part around button image if you want to make margin between background and button.


![toggleView_design2](http://f.cl.ly/items/3d0A0C381j3o401i2C03/toggleView_design2.png)    
