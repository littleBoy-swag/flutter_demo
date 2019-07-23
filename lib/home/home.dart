import 'package:flutter/material.dart';
import 'package:flutter_demo/common/ui/icon_tab.dart';
import 'package:flutter_demo/message/msg_view.dart';
import 'package:flutter_demo/recommend/jobs_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/utils/util.dart';
import 'package:flutter_demo/my/my_view.dart';
import 'package:flutter_demo/company/company_view.dart';

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
  DateTime lastPopTime;

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
    return WillPopScope(
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[JobsTab(), CompanysTab(), MsgsTab(), MyTab()],
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
                color:
                    _curIndex == INDEX_MSG ? _kPrimaryColor : Colors.cyan[300],
              ),
              IconTab(
                icon: _curIndex == INDEX_MY
                    ? "assets/images/me_sel.png"
                    : "assets/images/me_nor.png",
                text: "我的",
                color:
                    _curIndex == INDEX_MY ? _kPrimaryColor : Colors.cyan[300],
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        // 点击返回键的操作
        if (lastPopTime == null ||
            DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
          lastPopTime = DateTime.now();
          ToastUtil.showToast('再按一次退出应用');
        } else {
          lastPopTime = DateTime.now();
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
