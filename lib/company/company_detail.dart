import 'package:flutter/material.dart';
import 'company.dart';
import 'company_hot_job.dart';
import 'company_inc.dart';
import 'company_info.dart';
import 'package:flutter_demo/common/ui/indicator_viewapager.dart';

const double _kAppBarHeight = 255.0;

class CompanyDetail extends StatefulWidget {
  final Company _company;

  CompanyDetail(this._company);

  @override
  CompanyDetailState createState() => CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _imagePage;
  TabController _controller;
  List<String> _urls = [
    'https://gw.alipayobjects.com/zos/rmsportal/rdDIHRctzBPCgOiKAKDG.jpg',
    'https://gw.alipayobjects.com/zos/rmsportal/UUYEwxEZfKjrarbCDBBf.jpg',
    'https://gw.alipayobjects.com/zos/rmsportal/dqHtpdbLPSTUHVYZBUGV.jpg'
  ];
  Widget _companyTabContent;
  VoidCallback onChanged;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    if (_urls.isNotEmpty) {
      _imagePage = <Widget>[];
      _urls.forEach((String url) {
        _imagePage.add(
          Container(
            color: Colors.black.withAlpha(900),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                height: _kAppBarHeight,
              ),
            ),
          ),
        );
      });
    }
    _tabs = [
      Tab(
        text: '公司概况',
      ),
      Tab(
        text: '热招职位',
      ),
    ];
    _companyTabContent = CompanyInc(widget._company.inc);
    _controller = TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        if (_curIndex == 0) {
          _companyTabContent = CompanyInc(widget._company.inc);
        } else {
          _companyTabContent = CompanyHotJob();
        }
        _curIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(_kAppBarHeight),
                  child: IndicatorViewPager(_imagePage),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CompanyInfo(widget._company),
                      Divider(),
                      TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(fontSize: 16.0),
                        labelColor: Colors.black,
                        controller: _controller,
                        tabs: _tabs,
                        indicatorColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                _companyTabContent,
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            left: -10.0,
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: BackButton(color: Colors.black,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }
}
