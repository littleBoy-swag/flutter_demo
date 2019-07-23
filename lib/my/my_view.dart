import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final double _appBarHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: const <Color>[
                          Color.fromARGB(255, 0, 215, 198),
                          Colors.greenAccent
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          left: 30.0,
                          right: 20.0,
                        ),
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                              "https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=5fb1e8e7f6dcd100d991f07313e22c75/0eb30f2442a7d933ace3a699a34bd11372f00194.jpg"),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  "勒布朗 · 詹姆斯",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Text(
                                "SF -- 就职于美国洛杉矶湖人队",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _ContactItem(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "正在开发",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      content: Text(
                                        "已投递",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    );
                                  });
                            },
                            count: "120",
                            title: "已投递",
                          ),
                          _ContactItem(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "正在开发",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      content: Text(
                                        "已沟通",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    );
                                  });
                            },
                            count: "71",
                            title: "已沟通",
                          ),
                          _ContactItem(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "正在开发",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      content: Text(
                                        "待面试",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    );
                                  });
                            },
                            count: "59",
                            title: "待面试",
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.count, this.title, this.onPressed});
  final String count;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Text(
              count,
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
