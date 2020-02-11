import 'package:base_scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: teamsBody(),
      toolbarTitle: 'Team',
      toolbarRightText: 'Add',
      toolbarRightTextClick: () {},
      bodyBackgroundColor: Colors.white,
    );
  }

  Widget teamsBody() {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}
