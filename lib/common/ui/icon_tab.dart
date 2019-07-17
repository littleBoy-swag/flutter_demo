import 'package:flutter/material.dart';

class IconTab extends StatefulWidget {
  const IconTab({Key key, this.text, this.icon, this.color})
      : assert(text != null || icon != null || color != null),
        super(key: key);

  final String text;
  final String icon;
  final String color;

  @override
  IconTabState createState() {
    return IconTabState();
  }
}

class IconTabState extends State<IconTab> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
