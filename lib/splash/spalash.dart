import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_demo/home/home.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      // 跳转到主页面
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Text("Flutter应用",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
