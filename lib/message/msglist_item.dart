import 'package:flutter/material.dart';
import 'msg.dart';

class MsgListItem extends StatelessWidget {
  final Msg msg;
  MsgListItem(this.msg);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 0.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                bottom: 0.0,
              ),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(msg.avatar),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      msg.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, left: 0.0, right: 5.0, bottom: 5.0),
                    child: Text(msg.company + " | " + msg.position,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, left: 0.0, right: 5.0, bottom: 5.0),
                    child: Text(msg.msg,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
