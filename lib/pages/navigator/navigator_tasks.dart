import 'package:flutter/material.dart';
import 'package:learning_demo/models/task.dart';
import 'package:learning_demo/recycler_items/task_item.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Third"),
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(tabs: [
              Tab(text: "Todo", icon: Icon(Icons.list)),
              Tab(text: "In Progress", icon: Icon(Icons.access_time_sharp)),
              Tab(text: "Done", icon: Icon(Icons.done_all_outlined)),
            ]),
          ),
          body: TabBarView(
            children: [
              TaskItem(task: Task(
                  title: "Task title",
                  description: "Short description",
                  urgency: Urgency.medium)),
              Text("Second"),
              Text("Third"),
            ],
          ),
        ),
      )
    );
  }
}
