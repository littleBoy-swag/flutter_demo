import 'package:flutter/material.dart';
import 'msglist_item.dart';
import 'msg.dart';

class MsgsTab extends StatefulWidget {
  @override
  MsgList createState() => MsgList();
}

class MsgList extends State<MsgsTab> {
  List<Msg> _msgs = [];
  @override
  void initState() {
    super.initState();
    getMsgList();
  }

  void getMsgList() {
    setState(() {
      _msgs = Msg.fromJson("""
      {
        "list":[
          {
            "avatar":"http://b-ssl.duitang.com/uploads/item/201510/08/20151008192345_uPC5U.jpeg",
            "name":"宋伊人",
            "company":"字节跳动",
            "position":"HRBP",
            "msg":"在吗?"
          },{
            "avatar":"http://5b0988e595225.cdn.sohucs.com/images/20180803/cd2563e2057f467989842afa9b527f40.png",
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
            child: AlertDialog(
              content: Text(
                "敬请期待",
                style: TextStyle(fontSize: 20.0),
              ),
            ));
      },
      child: MsgListItem(msg),
    );
    return msgItem;
  }
}
