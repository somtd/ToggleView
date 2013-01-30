# ToggleView
==========
ToggleView is easy-to-use original toggle button.  
(see sample Xcode project in /Sample)
![toggleView_design1](http://f.cl.ly/items/0q0B422z3f1V3d2z1M3q/toggleView_design1.png)  

ToggleViewの主な要素は、 

- ToggleView
- ToggleButton
- ToggleBase

となっており、**ToggleView**が**ToggleBase**というボタンが移動する範囲の背景画像をもつビューと、ToggleBaseの上を左右いったり来たりする**ToggleButton**というボタンのビューからなりたっています。
**ToggleBase**、**ToggleButton**それぞれデザインを自由に入れられるようになっています。

##ToggleViewのタイプ
ToggleViewのタイプは現在、２種類用意しています。
引数の**toggleViewType:**を変更することで簡単に設定可能です。 

**toggleViewType:ToggleViewTypeWithLabel**:ToggleViewの左右にタップ可能なラベルがついているタイプ 

```objectivec
toggleViewWithLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeWithLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];
toggleViewWithLabel.toggleDelegate = self;
```

**toggleViewType:ToggleViewTypeNoLabel**:ToggleViewの左右にラベルがついていないタイプ 

```objectivec
toggleViewWithoutLabel = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeDefault];  
toggleViewWithoutLabel.toggleDelegate = self;
```

##ToggleBase（トグル・スイッチの背景）のタイプ
トグル・スイッチの背景を選択している状態に合わせて変更することができます。引数の**toggleBaseType:**を変更することで簡単に設定可能です。

**toggleBaseType:ToggleBaseTypeChangeImage**:ToggleViewの選択状態に応じて背景画像が変わるタイプ

```objectivec
toggleViewBaseChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
toggleViewBaseChange.toggleDelegate = self;
```
背景画像は**ToggleBase.m**の下記のファイル名を置き換えてください。

```objectivec
//change base image option
NSString *const TOGGLE_BASE_IMAGE_L     = @"toggle_base_l.png";
NSString *const TOGGLE_BASE_IMAGE_R     = @"toggle_base_r.png";
```
##ToggleBase（トグル・スイッチのボタン）のタイプ
トグル・スイッチのボタンを選択している状態に合わせて変更することができます。引数の**toggleButtonType:**を変更することで簡単に設定可能です。

**toggleButtonType:ToggleButtonTypeChangeImage**:ToggleViewの選択状態に応じて背景画像が変わるタイプ

```objectivec
toggleViewButtonChange = [[ToggleView alloc]initWithFrame:frame toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeDefault toggleButtonType:ToggleButtonTypeChangeImage];
toggleViewButtonChange.toggleDelegate = self;
```
ボタン画像は**ToggleButton.m**の下記のファイル名を置き換えてください。

```objectivec
//change button image option
NSString *const TOGGLE_BUTTON_IMAGE_L    = @"toggle_button_l.png";
NSString *const TOGGLE_BUTTON_IMAGE_R    = @"toggle_button_r.png";
```

##ToggleViewDelegateメソッドの実装

デリゲートというほどでもないですが、 ToggleView側でボタンを切り替える毎にSampleViewController側でも状態の切り替えを受け取るようになってます。

**SampleViewController.h**

```objectivec
#import "ToggleView.h"
@interface SampleViewController : UIViewController <ToggleViewDelegate>
```
**SampleViewController.m**

```objectivec
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

##TogleViewのプロパティ
プロパティに関しては最低限、トグル・スイッチの選択のみ用意しています。

**ToggleView.h**

```objectivec
@property (nonatomic) ToggleButtonSelected selectedButton;
```

選択状態を外部からも変更できるように実装しています。 

**ToggleView.m**

```objectivec
- (void)setSelectedButton:(ToggleButtonSelected)selectedButton
{
    switch (selectedButton) {
        case ToggleButtonSelectedLeft:
            [self onLeftButton:nil];
            break;
        case ToggleButtonSelectedRight:
            [self onRightButton:nil];
            break;
        default:
            break;
    }
}
```

##デザイン上の注意点
サンプルで表示されているデザインのようにトグル・スイッチの背景の外形とボタンの外形にマージンをとるためには、ボタンのデザイン部分に下図のように透明部分を作ってあげる必要があります。 

背景の外形とスイッチの外形をピッタリにしたい場合はこの限りではありません。

![toggleView_design2](http://f.cl.ly/items/3d0A0C381j3o401i2C03/toggleView_design2.png)    
