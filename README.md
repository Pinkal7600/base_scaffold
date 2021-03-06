# base_scaffold

[![pub package](https://img.shields.io/pub/v/base_scaffold.svg)](https://pub.dev/packages/base_scaffold)

A Flutter package for base **scaffold**. After importing this plugin to your project as usual, import base_scaffold.dart and use the BaseScaffold() for ready feature like toolbar, loaderView and etc...

## Demo [(example/base_scaffold_demo)](https://github.com/Pinkal7600/base_scaffold/tree/master/example)
<img src="https://raw.githubusercontent.com/Pinkal7600/base_scaffold/master/example/demo.gif" height="400" />

## Getting Started

After importing this plugin to your project as usual, import below to
use base_scaffold.

```dart
import 'package:base_scaffold/base_scaffold.dart';  
```

##### You are ready to use the base_scaffold.

### How to use?

```dart
@override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: myBody(),

      toolbarTitle: 'Team',
      toolbarRightText: 'Add',
      toolbarRightTextClick: () {
        // your event
      },

      bodyBackgroundColor: Colors.white,
    );
  }
```

## Properties:
These are below available properties for base_scaffold.

| Properties | type | details |
|--------|-----|-----|
| body | Widget | It contains the body of the screen which will be display in safe area and between toolbar and bottom navigation bar. |
| showToolbar | bool | Show/Hide toolbar. Default is true |
| toolbar | Widget | To design custom toolbar. |
| toolbarLeftIcon | dynamic | Set icon or image on left side of toolbar. Icon can be String for Image.assets or Icon, it will be depend on `toolbarLeftIconType`. |
| toolbarLeftIconType | String | Type of left Icon in toolbar. It can be image assets or Icon. For e.g : AppToolbar.IMAGE_TYPE_IMAGE or AppToolbar.IMAGE_TYPE_ICON. |
| toolbarLeftIconClick | Function | Get callback click of left icon. |
| toolbarRightIcon | dynamic | Set icon or image on right side of toolbar. Icon can be String for Image.assets or Icon, it will be depend on `toolbarRightIconType`. |
| toolbarRightIconType | String | Type of right Icon in toolbar. It can be image assets or Icon. For e.g : AppToolbar.IMAGE_TYPE_IMAGE or AppToolbar.IMAGE_TYPE_ICON. |
| toolbarRightIconClick | Function | Get callback click of rith icon. |
| toolbarTitle | String | Title of toolbar. |
| toolbarRightText | String | Set some text to right instead of icon. |
| toolbarRightTextClick | Function | Get callback click of right text. |
| toolbarLeftText | String | Set some text to left instead of icon. |
| toolbarLeftTextClick | Function | Get callback click of left text. |
| toolbarBackgroundColor | Color | Set toolbar background color. |
| toolbarHeight | double | Set custom toolbar height as per requirement. Minimum height should be 50. |
| toolbarLeftTextStyle | TextStyle | Set custom text style for left toolbar text. |
| toolbarTitleTextStyle | TextStyle | Set custom text style for title toolbar text. |
| toolbarRightTextStyle | TextStyle | Set custom text style for right toolbar text. |
| isScreenLoading | bool | Set bool to show/hide loader view or entire screen body. |
| isScreenLoadingWithBackground | bool | Set bool to show/hide loader view on screen body. |
| screenLoaderView | Widget | Set custom widget for in screen loader view. |
| backgroundScreenLoaderView | Widget | Set custom widget for on screen loader view. |
| scaffoldBackgroundColor | Color | Set scaffold background color. |
| bodyBackgroundColor | Color | Set body background color. |

**Note** : For more base_scaffold properties and details please check here : https://pub.dev/documentation/base_scaffold/latest/base_scaffold/BaseScaffold-class.html
