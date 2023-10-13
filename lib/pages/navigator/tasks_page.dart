import 'package:flutter/material.dart';
import 'package:learning_demo/pages/tabs/done_page.dart';
import 'package:learning_demo/pages/tabs/inprogress_page.dart';
import 'package:learning_demo/pages/tabs/todo_page.dart';

class TasksPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tasks MVC"),
            backgroundColor: Colors.orangeAccent,
            bottom: TabBar(tabs: [
              Tab(text: "Todo", icon: Icon(Icons.list)),
              Tab(text: "In Progress", icon: Icon(Icons.access_time_sharp)),
              Tab(text: "Done", icon: Icon(Icons.done_all_outlined)),
            ]),
          ),
          body: TabBarView(
            children: [
              TodoPage(),
              InProgressPage(),
              DonePage(),
            ],
          ),
        ),
      )
    );
  }
}
