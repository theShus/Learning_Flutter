import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/task.dart';
import '../../../recycler_items/task_item.dart';
import '../../../tasks_mvc/tabs_controller.dart';
import '../../../tasks_mvc/tabs_controller_interface.dart';
import '../../pages/tasks/edit_task_page.dart';
import '../components/task_bloc.dart';
import '../components/task_event.dart';
import '../components/task_state.dart';

class InProgressPageBloc extends StatefulWidget {
  @override
  State<InProgressPageBloc> createState() => _InProgressPageBlocState();
}

class _InProgressPageBlocState extends State<InProgressPageBloc> {
  final TabsControllerInterface tabsController = TabsController();

  void onTaskItemButtonPressed(CallbackFunctionType type, Task task) {
    setState(() {
      switch (type) {
        case CallbackFunctionType.RIGHT:
          setState(() {
            context.read<TaskBloc>().add(MoveTaskToDone(task: task));
          });
        case CallbackFunctionType.LEFT:
          setState(() {
            context.read<TaskBloc>().add(MoveTaskToTodo(task: task));
          });
        case CallbackFunctionType.DELETE:
          context.read<TaskBloc>().add(DeleteTask(task: task));
        case CallbackFunctionType.EDIT:
          setState(() {
            OpenEditTaskPage(context, task);
          });        default:
          print("Error occurred");
      }
    });
  }

  Future<void> OpenEditTaskPage(BuildContext context, Task task) async {
    Task editedTask = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditTaskPage(task: task)));
    if (!mounted) return;
    editedTask.progress = Progress.IN_PROGRESS;
    setState(() {
      context.read<TaskBloc>().add(UpdateTask(task: editedTask));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded)
          return Scaffold(
            body: ListView(
              children: state.inProgressTasks
                  .map((task) => TaskItem(
                      task: task,
                      onButtonPressed: (CallbackFunctionType type, Task task) =>
                          onTaskItemButtonPressed(type, task)))
                  .toList(),
            ),
          );
        else if (state is TasksLoading)
          return CircularProgressIndicator();
        else
          return Text("Error while loading");
      },
    );
  }
}
