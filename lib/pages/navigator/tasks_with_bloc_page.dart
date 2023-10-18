import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/tasks_bloc/components/task_bloc.dart';
import 'package:learning_demo/tasks_bloc/tasks_tabs/done_page_bloc.dart';
import 'package:learning_demo/tasks_bloc/tasks_tabs/in_progress_page_bloc.dart';
import 'package:learning_demo/tasks_bloc/tasks_tabs/todo_page_bloc.dart';

import '../../models/task.dart';
import '../../tasks_bloc/components/task_event.dart';

class TasksWithBlocPage extends StatelessWidget {

  final List<Task> todoTestingTasks = [
    Task(title: "Todo1", description: "Desc1", urgency: Urgency.low, progress: Progress.TODO),
    Task(title: "Todo2", description: "Desc2", urgency: Urgency.medium, progress: Progress.TODO),
  ];

  final List<Task> progressTestingTasks = [
    Task(title: "Progress1", description: "Desc3", urgency: Urgency.low, progress: Progress.IN_PROGRESS),
    Task(title: "Progress2", description: "Desc4", urgency: Urgency.medium, progress: Progress.IN_PROGRESS),
  ];

  final List<Task> doneTestingTasks = [
    Task(title: "Done1", description: "Desc4", urgency: Urgency.low, progress: Progress.DONE),
    Task(title: "Done2", description: "Desc5", urgency: Urgency.medium, progress: Progress.DONE),
  ];


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => TaskBloc()
                ..add(LoadTasks(todoTasks: todoTestingTasks, inProgressTasks: progressTestingTasks, doneTasks: doneTestingTasks)
              )
          ),
        ],
        child:
        Scaffold(
            body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tasks MVC"),
              backgroundColor: Colors.deepPurple,
              bottom: TabBar(tabs: [
                Tab(text: "Todo", icon: Icon(Icons.list)),
                Tab(text: "In Progress", icon: Icon(Icons.access_time_sharp)),
                Tab(text: "Done", icon: Icon(Icons.done_all_outlined)),
              ]),
            ),
            body: TabBarView(
              children: [
                TodoPageBloc(),
                InProgressPageBloc(),
                DonePageBloc(),
              ],
            ),
          ),
        ))
    );
  }
}
