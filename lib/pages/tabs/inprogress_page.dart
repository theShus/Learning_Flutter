import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../recycler_items/task_item.dart';
import '../../tabs_mvc/tabs_controller.dart';
import '../add_task_page.dart';
import '../edit_task_page.dart';

class InProgressPage extends StatefulWidget{

  @override
  State<InProgressPage> createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {

  final TabsController tabsController = TabsController();

  void onTaskItemButtonPressed(CallbackFunctionType type, Task task) {
    setState(() {
      switch (type){
        case CallbackFunctionType.RIGHT: tabsController.moveTaskToDone(task);
        case CallbackFunctionType.LEFT: tabsController.moveTaskToTodo(task);
        case CallbackFunctionType.DELETE: tabsController.deleteTask(task);
        case CallbackFunctionType.EDIT: OpenEditTaskPage(context, task);
        default: print("Error occurred");
      }
      tabsController.sortTasksByUrgency();
    });
  }


  Future<void> OpenEditTaskPage(BuildContext context, Task task) async {
    Task editedTask = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditTaskPage(task: task)));
    if (!mounted) return;
    editedTask.progress = Progress.IN_PROGRESS;
    setState(() => tabsController.editTask(editedTask));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: tabsController.inProgressTasks
            .map((task) => TaskItem(
            task: task,
            onButtonPressed: (CallbackFunctionType type, Task task) => onTaskItemButtonPressed(type, task)
        )).toList(),
      ),
    );
  }
}