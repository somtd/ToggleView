# ToggleView
==========
ToggleView is easy-to-use original toggle button.  
(see sample Xcode project in /Sample)

## Toggle with label.
```objective-c
toggleViewWithLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeWithLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
    toggleViewWithLabel.toggleDelegate = self;```

## Toggle without label.
```objective-c
	toggleViewWithoutLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
    toggleViewWithoutLabel.toggleDelegate = self;```
    
## Toggle base image change.
```objective-c
toggleViewBaseChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
    toggleViewBaseChange.toggleDelegate = self;```
    
## Toggle button image change.
```objective-c
toggleViewButtonChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeChangeImage];
    toggleViewButtonChange.toggleDelegate = self;```
    
