import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_toolbar.dart';

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

  BaseScaffold({
    this.body,
    this.toolbar,
    this.isScreenLoading = false,
    this.isScreenLoadingWithBackground = false,
    this.showToolbar = true,
    this.toolbarLeftIcon,
    this.toolbarLeftIconType,
    this.toolbarLeftIconClick,
    this.toolbarRightIcon,
    this.toolbarRightIconType,
    this.toolbarRightIconClick,
    this.toolbarTitle,
    this.toolbarRightText,
    this.toolbarRightTextClick,
    this.toolbarLeftText,
    this.toolbarLeftTextClick,
    this.screenLoaderView,
    this.backgroundScreenLoaderView,
    this.bodyBackgroundColor = Colors.white,
    this.scaffoldBackgroundColor = Colors.white,
    this.toolbarBackgroundColor = Colors.white,
  });

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
                widget.body,
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
      ? AppToolbar(
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
