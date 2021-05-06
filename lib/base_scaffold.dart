import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_toolbar.dart';

class BaseScaffold extends StatefulWidget {
  /// It contains the body of the screen which will be display in safe area
  /// and between toolbar and bottom navigation bar.
  final Widget? body;

  /// Design your own custom toolbar.
  final Widget? toolbar;

  /// Design custom widget for loader view where body will display empty.
  final Widget? screenLoaderView;

  /// Design custom widget for loader view which will display with
  /// body content.
  final Widget? backgroundScreenLoaderView;

  /// Set true to show loading.
  /// @Note: This will hide the body and display empty screen.
  final bool isScreenLoading;

  /// Set true to show loading with body in background.
  /// @Note: This will show body in background and loader on it.
  final bool isScreenLoadingWithBackground;

  /// Show/Hide toolbar by true/false value.
  /// By default it's value is true.
  final bool showToolbar;

  /// Set scaffold background color.
  final Color scaffoldBackgroundColor;

  /// Set toolbar background color.
  final Color toolbarBackgroundColor;

  /// Set body background color.
  final Color bodyBackgroundColor;

  // Toolbar
  /// Set icon on left side of the toolbar.
  /// Icon can be an [String] value if you use an assets
  ///                   OR
  /// Icon can be an [IconData] if you use Icons.
  final toolbarLeftIcon;

  /// If you set left icon you need to provide the type of icon.
  /// Use this to set type of icon can be from below two option.
  /// * [BaseToolbar.IMAGE_TYPE_IMAGE] if icon is from assets.
  /// * [BaseToolbar.IMAGE_TYPE_ICON] if icon is type of Icons.
  ///
  /// @Note: If you not provide any type to left icon then left icon will
  /// not display in toolbar.
  final String? toolbarLeftIconType;

  /// Set left icon click event if you have used [toolbarLeftIcon] &
  /// [toolbarLeftIconType].
  final Function? toolbarLeftIconClick;

  /// Set icon on right side of the toolbar.
  /// Icon can be an [String] value if you use an assets
  ///                   OR
  /// Icon can be an [IconData] if you use Icons.
  final toolbarRightIcon;

  /// If you set right icon you need to provide the type of icon.
  /// Use this to set type of icon can be from below two option.
  /// * [BaseToolbar.IMAGE_TYPE_IMAGE] if icon is from assets.
  /// * [BaseToolbar.IMAGE_TYPE_ICON] if icon is type of Icons.
  ///
  /// @Note: If you not provide any type to right icon then right icon will
  /// not display in toolbar.
  final String? toolbarRightIconType;

  /// Set right icon click event if you have used [toolbarRightIcon] &
  /// [toolbarRightIconType].
  final Function? toolbarRightIconClick;

  /// Set title on toolbar.
  final String? toolbarTitle;

  /// Set text at right side of toolbar.
  final String? toolbarRightText;

  /// Set click event of right side text.
  /// @Note: It will not work if [toolbarRightText] is empty or not set.
  final Function? toolbarRightTextClick;

  /// Set text at left side of toolbar.
  final String? toolbarLeftText;

  /// Set click event of left side text.
  /// @Note: It will not work if [toolbarLeftText] is empty or not set.
  final Function? toolbarLeftTextClick;

  /// Manage height of toolbar.
  /// By default it height is [60] and it can not be less than [50].
  final double toolbarHeight;

  /// Set custom text style of left text in toolbar.
  final TextStyle? toolbarLeftTextStyle;

  /// Set custom text style of title text in toolbar.
  final TextStyle? toolbarTitleTextStyle;

  /// Set custom text style of right text in toolbar.
  final TextStyle? toolbarRightTextStyle;

  /// Use to set only color of left icon.
  final Color? toolbarLeftIconColor;

  /// Use to set only color of right icon.
  final Color? toolbarRightIconColor;

  /// Make custom widget to set at left side of toolbar.
  final Widget? toolbarLeftChild;

  /// Make custom widget to set at center of toolbar.
  final Widget? toolbarCenterChild;

  /// Make custom widget to set at right side of toolbar.
  final Widget? toolbarRightChild;

  // Scaffold
  /// Default properties of [Scaffold]
  final bool extendBody;

  /// Default properties of [Scaffold]
  final bool extendBodyBehindAppBar;

  /// Default properties of [Scaffold]
  final Widget? floatingActionButton;

  /// Default properties of [Scaffold]
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Default properties of [Scaffold]
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Default properties of [Scaffold]
  final List<Widget>? persistentFooterButtons;

  /// Default properties of [Scaffold]
  final Widget? drawer;

  /// Default properties of [Scaffold]
  final Widget? endDrawer;

  /// Default properties of [Scaffold]
  final Color? drawerScrimColor;

  /// Default properties of [Scaffold]
  final Widget? bottomNavigationBar;

  /// Default properties of [Scaffold]
  final Widget? bottomSheet;

  /// Default properties of [Scaffold]
  final bool? resizeToAvoidBottomInset;

  /// Default properties of [Scaffold]
  final bool primary;

  /// Default properties of [Scaffold]
  final DragStartBehavior drawerDragStartBehavior;

  /// Default properties of [Scaffold]
  final double? drawerEdgeDragWidth;

  /// Default properties of [Scaffold]

  BaseScaffold({
    this.body,
    this.toolbar,
    this.isScreenLoading = false,
    this.isScreenLoadingWithBackground = false,
    this.showToolbar = true,
    this.toolbarLeftIcon,
    this.toolbarLeftIconColor,
    this.toolbarLeftIconType,
    this.toolbarLeftIconClick,
    this.toolbarRightIcon,
    this.toolbarRightIconColor,
    this.toolbarRightIconType,
    this.toolbarRightIconClick,
    this.toolbarTitle,
    this.toolbarRightText,
    this.toolbarRightTextClick,
    this.toolbarLeftText,
    this.toolbarLeftTextClick,
    this.toolbarHeight = 60,
    this.toolbarLeftChild,
    this.toolbarCenterChild,
    this.toolbarRightChild,
    this.screenLoaderView,
    this.backgroundScreenLoaderView,
    this.bodyBackgroundColor = Colors.white,
    this.scaffoldBackgroundColor = Colors.white,
    this.toolbarBackgroundColor = Colors.white,
    this.toolbarLeftTextStyle,
    this.toolbarTitleTextStyle,
    this.toolbarRightTextStyle,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
  }) : assert(toolbarHeight > 50);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldBackgroundColor,
      body: SafeArea(
        child: scaffoldBody(),
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
    );
  }

  Column scaffoldBody() {
    return Column(
      children: <Widget>[
        toolbar(),
        Expanded(
          child: Container(
            color: widget.bodyBackgroundColor,
            child: widget.isScreenLoading
                ? loadingView()
                : Stack(
                    children: <Widget>[
                      widget.body ?? Container(),
                      widget.isScreenLoadingWithBackground
                          ? loadingViewWithBackground()
                          : Container(),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget toolbar() => widget.toolbar != null
      ? widget.toolbar!
      : widget.showToolbar
          ? BaseToolbar(
              leftIconType: widget.toolbarLeftIconType,
              leftIcon: widget.toolbarLeftIcon,
              leftIconClick: widget.toolbarLeftIconClick,
              rightIcon: widget.toolbarRightIcon,
              rightIconType: widget.toolbarRightIconType,
              rightIconClick: widget.toolbarRightIconClick,
              title: widget.toolbarTitle,
              rightText: widget.toolbarRightText,
              rightTextClick: widget.toolbarRightTextClick,
              leftText: widget.toolbarLeftText,
              leftTextClick: widget.toolbarLeftTextClick,
              backgroundColor: widget.toolbarBackgroundColor,
              toolbarHeight: widget.toolbarHeight,
              leftTextStyle: widget.toolbarLeftTextStyle,
              titleTextStyle: widget.toolbarTitleTextStyle,
              rightTextStyle: widget.toolbarRightTextStyle,
              leftIconColor: widget.toolbarLeftIconColor,
              rightIconColor: widget.toolbarRightIconColor,
              leftChild: widget.toolbarLeftChild,
              centerChild: widget.toolbarCenterChild,
              rightChild: widget.toolbarRightChild,
            )
          : Container();

  Widget loadingView() {
    return Center(
      child: widget.screenLoaderView != null
          ? widget.screenLoaderView
          : CupertinoActivityIndicator(
              animating: true,
              radius: 15,
            ),
    );
  }

  Widget loadingViewWithBackground() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: Container(
            color: Colors.black,
          ),
        ),
        Center(
          child: widget.backgroundScreenLoaderView ??
              CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
        ),

        /// Use below loading dialog with background
//        centerLoading(),
      ],
    );
  }

  Center centerLoading() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 35),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
              SizedBox(height: 10),
              Text("Loading..."),
            ],
          ),
        ),
      ),
    );
  }
}
