import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/models/task.dart';
import 'package:learning_demo/pages/tasks/add_task_page.dart';
import 'package:learning_demo/pages/tasks/edit_task_page.dart';
import 'package:learning_demo/recycler_items/task_item.dart';
import 'package:learning_demo/tasks_bloc/task_bloc.dart';
import 'package:learning_demo/tasks_bloc/task_state.dart';
import 'package:learning_demo/tasks_mvc/tabs_controller.dart';
import 'package:learning_demo/tasks_mvc/tabs_controller_interface.dart';

class TodoPageBloc extends StatefulWidget {
  @override
  State<TodoPageBloc> createState() => _TodoPageBlocState();
}

class _TodoPageBlocState extends State<TodoPageBloc> {
  final TabsControllerInterface tabsController = TabsController();

  void onTaskItemButtonPressed(CallbackFunctionType type, Task task) {
    setState(() {
      switch (type) {
        case CallbackFunctionType.RIGHT:
          tabsController.moveTaskToInProgress(task);
        case CallbackFunctionType.DELETE:
          tabsController.deleteTask(task);
        case CallbackFunctionType.EDIT:
          OpenEditTaskPage(context, task);
        default:
          print("Error occurred");
      }
    });
  }

  Future<void> OpenAddTaskPage(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    Task taskToAdd = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskPage()));
    if (!mounted)
      return; //OVO NAS STITI AKO SE STRANICA ZATVORI, DA NE VRATI NULL

    setState(() => tabsController.createTask(taskToAdd));

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text("Task " + taskToAdd.title + " created")));
  }

  Future<void> OpenEditTaskPage(BuildContext context, Task task) async {
    Task editedTask = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditTaskPage(task: task)));
    if (!mounted) return;
    setState(() => tabsController.editTask(editedTask));
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded)
          return Scaffold(
            body: ListView(
              children: state.todoTasks
                  .map((task) => TaskItem(
                      task: task,
                      onButtonPressed: (CallbackFunctionType type, Task task) => onTaskItemButtonPressed(type, task)))
                  .toList(),
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: "AddTaskBlocBtn",
              backgroundColor: Colors.yellow,
              child: Icon(Icons.add),
              onPressed: () {
                OpenAddTaskPage(context);
              },
            ),
          );
        else if (state is TasksLoading)
          return CircularProgressIndicator();
        else return Text("Error while loading");
      },
    );
  }
}
