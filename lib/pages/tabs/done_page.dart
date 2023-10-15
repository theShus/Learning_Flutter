import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../recycler_items/task_item.dart';
import '../../tabs_mvc/tabs_controller.dart';
import '../../tabs_mvc/interface/tabs_controller_interface.dart';
import '../edit_task_page.dart';

class DonePage extends StatefulWidget{

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {

  final TabsControllerInterface tabsController = TabsController();

  void onTaskItemButtonPressed(CallbackFunctionType type, Task task) {
    setState(() {
      switch (type){
        case CallbackFunctionType.DELETE: tabsController.deleteTask(task);
        case CallbackFunctionType.EDIT: OpenEditTaskPage(context, task);
        default: print("Error occurred");
      }
    });
  }

  Future<void> OpenEditTaskPage(BuildContext context, Task task) async {
    Task editedTask = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditTaskPage(task: task)));
    if (!mounted) return;
    editedTask.progress = Progress.DONE;
    setState(() => tabsController.editTask(editedTask));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: tabsController.getDoneTasks()
            .map((task) => TaskItem(
            task: task,
            onButtonPressed: (CallbackFunctionType type, Task task) => onTaskItemButtonPressed(type, task)
        )).toList(),
      ),
    );
  }
}