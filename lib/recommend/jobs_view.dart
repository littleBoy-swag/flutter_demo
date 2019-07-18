import 'package:flutter/material.dart';
import 'joblist_item.dart';
import 'job.dart';

class JobsTab extends StatefulWidget {
  @override
  JobList createState() => JobList();
}

class JobList extends State<JobsTab> {
  List<Job> _jobs = [];
  @override
  void initState() {
    super.initState();
    getJobList();
  }

  void getJobList() {
    setState(() {
      _jobs = Job.fromJson("""
      {
        "list":[
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
          },
          {
            "name":"架构师(Android)",
            "cname":"蚂蚁金服",
            "size":"D轮",
            "salary":"25k-40k",
            "username":"Clarie",
            "title":"HR"
          },{
            "name":"高级Android研发工程师",
            "cname":"字节跳动",
            "size":"B轮",
            "salary":"40k-60k",
            "username":"Kimi",
            "title":"HRBP"
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
          "推荐",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _jobs.length,
        itemBuilder: _buildJobItem,
      ),
    );
  }

  Widget _buildJobItem(BuildContext context, int index) {
    Job job = _jobs[index];
    var jobItem = InkWell(
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
      child: JobListItem(job),
    );
    return jobItem;
  }
}
