import 'package:flutter/material.dart';
import 'companylist_item.dart';
import 'company.dart';
import 'company_detail.dart';

class CompanysTab extends StatefulWidget {
  @override
  CompanyList createState() => CompanyList();
}

class CompanyList extends State<CompanysTab> with AutomaticKeepAliveClientMixin{
  List<Company> _companys = [];
  @override
  void initState() {
    super.initState();
    getCompanyList();
  }

  @override
  bool get wantKeepAlive => true;

  void getCompanyList() {
    setState(() {
      _companys = Company.fromJson("""
      {
      "list":[
      {
      "logo": "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3178826071,850809337&fm=27&gp=0.jpg",
            "name": "杭州蚂蚁金服信息技术有限公司",
            "location": "上海市浦东新区",
            "type": "互联网",
            "size": "D轮",
            "employee": "10000人以上",
            "hot": "资深Android架构师",
            "count": "500",
            "inc": "蚂蚁金服是一家旨在为世界带来普惠金融服务的科技企业。蚂蚁金服起步于 2004 年成立的支付宝。2014 年 10 月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来更多平等的机会”为使命，致力于通过科技创新能力，搭建一个开放、共享的信用体系和金融服务平台，为全球消费者和小微企业提供安全、便捷的普惠金融服务。"
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
          "公司",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _companys.length,
        itemBuilder: _buildCompanyItem,
      ),
    );
  }

  Widget _buildCompanyItem(BuildContext context, int index) {
    Company company = _companys[index];
    var companyItem = InkWell(
      onTap: () => navCompanyDetail(company,index),
      child: CompanyListItem(company),
    );
    return companyItem;
  }
  void navCompanyDetail(Company company,int index) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __){
        return CompanyDetail(company);
      },
      transitionsBuilder: (_,Animation<double> animation, __, Widget child){
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0),
              end: Offset.zero
            ).animate(animation),
            child: child,
          ),
        );
      }
    ));
  }
}
