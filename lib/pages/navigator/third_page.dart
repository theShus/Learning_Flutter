import 'package:flutter/material.dart';
import 'package:learning_demo/models/task.dart';
import 'package:learning_demo/pages/tabs/done_page.dart';
import 'package:learning_demo/pages/tabs/inprogress_page.dart';
import 'package:learning_demo/pages/tabs/todo_page.dart';
import 'package:learning_demo/recycler_items/task_item.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text("Third page")),
    );
  }
}
