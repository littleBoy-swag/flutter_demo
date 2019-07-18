import 'package:flutter/material.dart';

class MsgPage extends StatefulWidget {
  @override
  MsgState createState() {
    return MsgState();
  }
}

class MsgState extends State<MsgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "message",
      ),
    ));
  }
}