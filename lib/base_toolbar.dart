import 'package:flutter/material.dart';

class BaseToolbar extends StatefulWidget {
  static const String IMAGE_TYPE_IMAGE = "image";
  static const String IMAGE_TYPE_ICON = "icon";

  final leftIcon;
  final String leftIconType;
  final Function leftIconClick;

  final rightIcon;
  final String rightIconType;
  final Function rightIconClick;

  final String title;
  final String rightText;
  final Function rightTextClick;
  final String leftText;
  final Function leftTextClick;

  final Color backgroundColor;

  BaseToolbar({
    this.leftIconType,
    this.leftIcon,
    this.leftIconClick,
    this.rightIcon,
    this.rightIconType,
    this.rightIconClick,
    this.title,
    this.rightText,
    this.rightTextClick,
    this.leftText,
    this.leftTextClick,
    this.backgroundColor = Colors.white,
  });

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
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: widget.leftIcon != null
                  ? leftIconWidget(widget.leftIconClick)
                  : leftTextTitle(widget.leftText, widget.leftTextClick)),
          Expanded(flex: 4, child: centerText(widget.title)),
          Expanded(
              flex: 1,
              child: widget.rightIcon != null
                  ? rightIconWidget(widget.rightIconClick)
                  : rightTextTitle(widget.rightText, widget.rightTextClick)),
//        leftIconWidget(leftIconClick),
        ],
      ),
    );
  }

  Widget leftIconWidget(leftIconClick) {
    return GestureDetector(
      onTap: leftIconClick,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: getLeftIcon(widget.leftIconType, widget.leftIcon),
      ),
    );
  }

  Widget getLeftIcon(leftIconType, leftIcon) {
    if (leftIconType == BaseToolbar.IMAGE_TYPE_IMAGE) {
      return Image.asset(
        leftIcon,
        height: 30,
        width: 30,
      );
    } else if (leftIconType == BaseToolbar.IMAGE_TYPE_ICON) {
      return Icon(
        leftIcon,
        color: themeData.primaryColor,
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
          style: themeData.textTheme.subtitle
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
        style: themeData.textTheme.title
            .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
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
          style: themeData.textTheme.subtitle
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
        child: getRightIcon(widget.rightIconType, widget.rightIcon),
      ),
    );
  }

  Widget getRightIcon(rightIconType, rightIcon) {
    if (rightIconType == BaseToolbar.IMAGE_TYPE_IMAGE) {
      return Image.asset(
        rightIcon,
        height: 30,
        width: 30,
      );
    } else if (rightIconType == BaseToolbar.IMAGE_TYPE_ICON) {
      return Icon(
        rightIcon,
        color: themeData.primaryColor,
      );
    } else {
      return Container();
    }
  }
}
