import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/task.dart';
import '../../../recycler_items/task_item.dart';
import '../../../tasks_mvc/tabs_controller.dart';
import '../../../tasks_mvc/tabs_controller_interface.dart';
import '../../pages/tasks/edit_task_page.dart';
import '../components/task_bloc.dart';
import '../components/task_state.dart';

class DonePageBloc extends StatefulWidget{

  @override
  State<DonePageBloc> createState() => _DonePageBlocState();
}

class _DonePageBlocState extends State<DonePageBloc> {

  final TabsControllerInterface tabsController = TabsController();

  void onTaskItemButtonPressed(CallbackFunctionType type, Task task) {
    setState(() {
      switch (type){
        case CallbackFunctionType.DELETE: //todo tabsController.deleteTask(task);
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
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded)
          return Scaffold(
            body: ListView(
              children: state.doneTasks
                  .map((task) => TaskItem(
                  task: task,
                  onButtonPressed: (CallbackFunctionType type, Task task) => onTaskItemButtonPressed(type, task)))
                  .toList(),
            ),
          );
        else if (state is TasksLoading) return CircularProgressIndicator();
        else return Text("Error while loading");
      },
    );
  }
}