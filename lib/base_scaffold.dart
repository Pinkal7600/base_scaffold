import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_toolbar.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final Widget toolbar;
  final Widget screenLoaderView;
  final Widget backgroundScreenLoaderView;
  final bool isScreenLoading;
  final bool isScreenLoadingWithBackground;
  final bool showToolbar;

  final Color scaffoldBackgroundColor;
  final Color toolbarBackgroundColor;
  final Color bodyBackgroundColor;

  // Toolbar
  final toolbarLeftIcon;
  final String toolbarLeftIconType;
  final Function toolbarLeftIconClick;
  final toolbarRightIcon;
  final String toolbarRightIconType;
  final Function toolbarRightIconClick;
  final String toolbarTitle;
  final String toolbarRightText;
  final Function toolbarRightTextClick;
  final String toolbarLeftText;
  final Function toolbarLeftTextClick;
  final double toolbarHeight;
  final TextStyle toolbarLeftTextStyle;
  final TextStyle toolbarTitleTextStyle;
  final TextStyle toolbarRightTextStyle;
  final Color toolbarLeftIconColor;
  final Color toolbarRightIconColor;
  final Widget toolbarLeftChild;
  final Widget toolbarCenterChild;
  final Widget toolbarRightChild;

  // Scaffold
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Color drawerScrimColor;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final bool resizeToAvoidBottomPadding;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double drawerEdgeDragWidth;

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
    this.resizeToAvoidBottomPadding,
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
      resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
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
      ? widget.toolbar
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
