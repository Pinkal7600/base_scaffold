# base_scaffold

[![pub package](https://img.shields.io/pub/v/base_scaffold.svg)](https://pub.dev/packages/base_scaffold)

## Demo (example/base_scaffold_demo)
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
For properties which are available in base_scaffold. Please refer this : [**base_scaffold Wiki**](https://github.com/Pinkal7600/base_scaffold/wiki/base_scaffold)

