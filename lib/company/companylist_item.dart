import 'package:flutter/material.dart';
import 'company.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;

  CompanyListItem(this.company);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 3.0,
        left: 5.0,
        right: 5.0,
        bottom: 3.0,
      ),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: 0.0,
                ),
                child: Image.network(
                  company.logo,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        company.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0.0,
                        left: 0.0,
                        right: 5.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        company.location,
                        style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        left: 0.0,
                        right: 5.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        company.type +
                            " | " +
                            company.size +
                            " | " +
                            company.employee,
                        style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5.0,
                            left: 0.0,
                            right: 5.0,
                            bottom: 15.0,
                          ),
                          child: Text(
                            "热招：" +
                                company.hot +
                                " 等" +
                                company.count +
                                "个职位",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8.0,
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
