import 'package:flutter/material.dart';
import 'msglist_item.dart';
import 'msg.dart';

class MsgsTab extends StatefulWidget {
  @override
  MsgList createState() => MsgList();
}

class MsgList extends State<MsgsTab> with AutomaticKeepAliveClientMixin {
  List<Msg> _msgs = [];
  @override
  void initState() {
    super.initState();
    getMsgList();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void getMsgList() {
    setState(() {
      _msgs = Msg.fromJson("""
      {
        "list":[
          {
            "avatar":"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=f04e9a4e6c09c93d13ff06a5fe5493b9/f3d3572c11dfa9ecb34a865769d0f703918fc10e.jpg",
            "name":"宋伊人",
            "company":"字节跳动",
            "position":"HRBP",
            "msg":"在吗?"
          },{
            "avatar":"https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=1eb71d5a6f380cd7f213aabfc02dc651/a6efce1b9d16fdfa01982404be8f8c5495ee7b60.jpg",
            "name":"王帅",
            "company":"蚂蚁金服",
            "position":"HR",
            "msg":"方便发一份简历吗?"
          }
        ]
      }
      """);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "消息",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _msgs.length,
        itemBuilder: _buildMsgItem,
      ),
    );
  }

  Widget _buildMsgItem(BuildContext context, int index) {
    Msg msg = _msgs[index];
    var msgItem = InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "正在开发",
                  style: TextStyle(fontSize: 18.0),
                ),
                content: Text(
                  "你有一条新消息",
                  style: TextStyle(fontSize: 15.0),
                ),
              );
            });
      },
      child: MsgListItem(msg),
    );
    return msgItem;
  }
}
