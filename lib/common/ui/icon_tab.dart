import 'package:flutter/material.dart';

const double _kTextAndIconTabHeight = 53.0;
const double _kMarginBottom = 3.0;

class IconTab extends StatefulWidget {
  const IconTab({Key key, this.text, this.icon, this.color})
      : assert(text != null || icon != null || color != null),
        super(key: key);

  final String text;
  final String icon;
  final Color color;

  @override
  IconTabState createState() {
    return IconTabState();
  }
}

class IconTabState extends State<IconTab> {

  Widget _buildLabelText(){
    return Text(widget.text,
      overflow: TextOverflow.fade,
      softWrap: false,
      style: TextStyle(
        color: widget.color
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {

    assert(debugCheckHasMaterial(context));
    
    double height = _kTextAndIconTabHeight;
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(widget.icon),
            height: 32.0,
            width: 32.0,
          ),
          margin: EdgeInsets.only(bottom: _kMarginBottom),
        ),
        _buildLabelText(),
      ],
    );

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

}
