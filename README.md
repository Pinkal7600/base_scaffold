# base_scaffold

A Flutter package for base **scaffold**. After importing this plugin to your project as usual, import base_scaffold.dart and use the BaseScaffold() for ready feature like toolbar, loaderView and etc...

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
These are below available properties in this package.

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
| isScreenLoading | bool | Set bool to show/hide loader view or entire screen body. |
| isScreenLoadingWithBackground | bool | Set bool to show/hide loader view on screen body. |
| screenLoaderView | Widget | Set custom widget for in screen loader view. |
| backgroundScreenLoaderView | Widget | Set custom widget for on screen loader view. |
| scaffoldBackgroundColor | Color | Set scaffold background color. |
| bodyBackgroundColor | Color | Set body background color. |

