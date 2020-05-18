import 'package:flutter/material.dart';

class BaseToolbar extends StatefulWidget {
  static const String IMAGE_TYPE_IMAGE = "image";
  static const String IMAGE_TYPE_ICON = "icon";

  // Toolbar
  /// Set icon on left side of the toolbar.
  /// Icon can be an [String] value if you use an assets
  ///                   OR
  /// Icon can be an [IconData] if you use Icons.
  final leftIcon;

  /// If you set left icon you need to provide the type of icon.
  /// Use this to set type of icon can be from below two option.
  /// * [BaseToolbar.IMAGE_TYPE_IMAGE] if icon is from assets.
  /// * [BaseToolbar.IMAGE_TYPE_ICON] if icon is type of Icons.
  ///
  /// @Note: If you not provide any type to left icon then left icon will
  /// not display in toolbar.
  final String leftIconType;

  /// Set left icon click event if you have used [leftIcon] &
  /// [leftIconType].
  final Function leftIconClick;

  /// Set icon on right side of the toolbar.
  /// Icon can be an [String] value if you use an assets
  ///                   OR
  /// Icon can be an [IconData] if you use Icons.
  final rightIcon;

  /// If you set right icon you need to provide the type of icon.
  /// Use this to set type of icon can be from below two option.
  /// * [BaseToolbar.IMAGE_TYPE_IMAGE] if icon is from assets.
  /// * [BaseToolbar.IMAGE_TYPE_ICON] if icon is type of Icons.
  ///
  /// @Note: If you not provide any type to right icon then right icon will
  /// not display in toolbar.
  final String rightIconType;

  /// Set right icon click event if you have used [rightIcon] &
  /// [rightIconType].
  final Function rightIconClick;

  /// Set title on toolbar.
  final String title;

  /// Set text at right side of toolbar.
  final String rightText;

  /// Set click event of right side text.
  /// @Note: It will not work if [rightText] is empty or not set.
  final Function rightTextClick;

  /// Set text at left side of toolbar.
  final String leftText;

  /// Set click event of left side text.
  /// @Note: It will not work if [leftText] is empty or not set.
  final Function leftTextClick;

  /// Manage height of toolbar.
  /// By default it height is [60] and it can not be less than [50].
  final double toolbarHeight;

  /// Set custom text style of left text in toolbar.
  final TextStyle leftTextStyle;

  /// Set custom text style of title text in toolbar.
  final TextStyle titleTextStyle;

  /// Set custom text style of right text in toolbar.
  final TextStyle rightTextStyle;

  /// Use to set only color of left icon.
  final Color leftIconColor;

  /// Use to set only color of right icon.
  final Color rightIconColor;

  /// Make custom widget to set at left side of toolbar.
  final Widget leftChild;

  /// Make custom widget to set at center of toolbar.
  final Widget centerChild;

  /// Make custom widget to set at right side of toolbar.
  final Widget rightChild;

  /// Set toolbar background color.
  final Color backgroundColor;

  BaseToolbar({
    this.leftIconType,
    this.leftIcon,
    this.leftIconColor,
    this.leftIconClick,
    this.rightIcon,
    this.rightIconColor,
    this.rightIconType,
    this.rightIconClick,
    this.title,
    this.rightText,
    this.rightTextClick,
    this.leftText,
    this.leftTextClick,
    this.backgroundColor = Colors.white,
    this.toolbarHeight = 60,
    this.leftTextStyle,
    this.titleTextStyle,
    this.rightTextStyle,
    this.leftChild,
    this.centerChild,
    this.rightChild,
  })  : assert(toolbarHeight > 50),
        assert(
            leftIcon != null
                ? leftIcon is String || leftIcon is IconData
                : true,
            "Please provide icon type in string(assets or local path) or IconData."),
        assert(
            rightIcon != null
                ? rightIcon is String || rightIcon is IconData
                : true,
            "Please provide icon type in string(assets or local path) or IconData.");

  @override
  _BaseToolbarState createState() => _BaseToolbarState();
}

class _BaseToolbarState extends State<BaseToolbar> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      color: widget.backgroundColor,
      height: widget.toolbarHeight,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: widget.leftChild != null
                  ? widget.leftChild
                  : widget.leftIcon != null
                      ? leftIconWidget(widget.leftIconClick)
                      : leftTextTitle(widget.leftText, widget.leftTextClick)),
          Expanded(
              flex: 4,
              child: widget.centerChild != null
                  ? widget.centerChild
                  : centerText(widget.title)),
          Expanded(
              flex: 1,
              child: widget.rightChild != null
                  ? widget.rightChild
                  : widget.rightIcon != null
                      ? rightIconWidget(widget.rightIconClick)
                      : rightTextTitle(
                          widget.rightText, widget.rightTextClick)),
        ],
      ),
    );
  }

  Widget leftIconWidget(leftIconClick) {
    return GestureDetector(
      onTap: leftIconClick,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: getLeftIcon(
            widget.leftIconType, widget.leftIcon, widget.leftIconColor),
      ),
    );
  }

  Widget getLeftIcon(leftIconType, leftIcon, leftIconColor) {
    if (leftIconType == BaseToolbar.IMAGE_TYPE_IMAGE) {
      return Image.asset(
        leftIcon,
        height: 30,
        width: 30,
      );
    } else if (leftIconType == BaseToolbar.IMAGE_TYPE_ICON) {
      return Icon(
        leftIcon,
        color: leftIconColor ?? themeData.primaryColor,
      );
    } else {
      return Container();
    }
  }

  Widget leftTextTitle(String leftText, leftTextClick) {
    return Container(
      child: leftText == null || leftText.isEmpty
          ? Container()
          : GestureDetector(
              onTap: leftTextClick,
              child: Text(
                leftText,
                style: widget.leftTextStyle ??
                    themeData.textTheme.subtitle2
                        .copyWith(color: themeData.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  Widget centerText(String title) {
    return Container(
      child: title == null || title.isEmpty
          ? Container()
          : Text(
              title,
              style: widget.titleTextStyle ??
                  themeData.textTheme.headline6.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
    );
  }

  Widget rightTextTitle(String rightText, rightTextClick) {
    return Container(
      child: rightText == null || rightText.isEmpty
          ? Container()
          : GestureDetector(
              onTap: rightTextClick,
              child: Text(
                rightText,
                style: widget.rightTextStyle ??
                    themeData.textTheme.subtitle2
                        .copyWith(color: themeData.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  Widget rightIconWidget(rightIconClick) {
    return GestureDetector(
      onTap: rightIconClick,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: getRightIcon(
            widget.rightIconType, widget.rightIcon, widget.rightIconColor),
      ),
    );
  }

  Widget getRightIcon(rightIconType, rightIcon, rightIconColor) {
    if (rightIconType == BaseToolbar.IMAGE_TYPE_IMAGE) {
      return Image.asset(
        rightIcon,
        height: 30,
        width: 30,
      );
    } else if (rightIconType == BaseToolbar.IMAGE_TYPE_ICON) {
      return Icon(
        rightIcon,
        color: rightIconColor ?? themeData.primaryColor,
      );
    } else {
      return Container();
    }
  }
}
