import 'package:flutter/material.dart';
import 'package:flutter_demo/common/ui/icon_tab.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MSG = 2;
const int INDEX_MY = 3;
Color _kPrimaryColor = Color.fromARGB(255, 0, 215, 198);

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _curIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(initialIndex: _curIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _curIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          tabs: <IconTab>[],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
