import 'package:base_scaffold/base_scaffold.dart';
import 'package:base_scaffold/base_toolbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isScreenLoading = false;
  bool _showLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isScreenLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isScreenLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      scaffoldBackgroundColor: Colors.orange,
      bodyBackgroundColor: Colors.orange,
      body: homeBody(),
      toolbarLeftIcon: Icons.arrow_back,
      toolbarLeftIconType: BaseToolbar.IMAGE_TYPE_ICON,
      toolbarTitle: 'Hello',
      toolbarRightText: 'Done',
      toolbarHeight: 80,
      toolbarTitleTextStyle: toolbarTitleTextStyle(),
      isScreenLoading: _isScreenLoading,
      isScreenLoadingWithBackground: _showLoading,
      screenLoaderView: emptyLoaderView(),
    );
  }

  ClipRRect emptyLoaderView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 50,
        width: 100,
        color: Colors.white,
        child: Center(
          child: Text(
            'Loading...',
          ),
        ),
      ),
    );
  }

  TextStyle toolbarTitleTextStyle() {
    return TextStyle(
        color: Colors.orange, fontSize: 22, fontWeight: FontWeight.bold);
  }

  Container homeBody() {
    return Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text('Empty screen loading...'),
              onPressed: () {
                setState(() {
                  _isScreenLoading = true;
                });
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    _isScreenLoading = false;
                  });
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text('Show Loading...'),
              onPressed: () {
                setState(() {
                  _showLoading = true;
                });
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    _showLoading = false;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
