import 'package:flutter/material.dart';
import 'package:flutter_demo/common/ui/icon_tab.dart';
import 'package:flutter_demo/my/my.dart';
import 'package:flutter_demo/company/company.dart';
import 'package:flutter_demo/message/message.dart';
import 'package:flutter_demo/recommend/jobs_view.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

const double _kTabTextSize = 11.0;
const int INDEX_RECOMMEND = 0;
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
        children: <Widget>[JobsTab(), CompanyPage(), MsgPage(), MyPage()],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: _kTabTextSize,
          ),
          tabs: <IconTab>[
            IconTab(
              icon: _curIndex == INDEX_RECOMMEND
                  ? "assets/images/home_sel.png"
                  : "assets/images/home_nor.png",
              text: "首页",
              color: _curIndex == INDEX_RECOMMEND
                  ? _kPrimaryColor
                  : Colors.cyan[300],
            ),
            IconTab(
              icon: _curIndex == INDEX_COMPANY
                  ? "assets/images/service_sel.png"
                  : "assets/images/service_nor.png",
              text: "公司",
              color: _curIndex == INDEX_COMPANY
                  ? _kPrimaryColor
                  : Colors.cyan[300],
            ),
            IconTab(
              icon: _curIndex == INDEX_MSG
                  ? "assets/images/second_sel.png"
                  : "assets/images/second_nor.png",
              text: "消息",
              color: _curIndex == INDEX_MSG ? _kPrimaryColor : Colors.cyan[300],
            ),
            IconTab(
              icon: _curIndex == INDEX_MY
                  ? "assets/images/me_sel.png"
                  : "assets/images/me_nor.png",
              text: "我的",
              color: _curIndex == INDEX_MY ? _kPrimaryColor : Colors.cyan[300],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
