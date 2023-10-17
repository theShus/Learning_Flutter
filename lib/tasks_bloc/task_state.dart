import 'package:equatable/equatable.dart';

import '../models/task.dart';

class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskLoading extends TaskState{}

class TaskLoaded extends TaskState{
  final List<Task> todoTasks;
  final List<Task> inProgressTasks;
  final List<Task> doneTasks;

  const TaskLoaded({this.todoTasks = const <Task>[], this.inProgressTasks = const <Task>[], this.doneTasks = const <Task>[]});

  @override
  List<Object> get props  => [todoTasks, inProgressTasks, doneTasks];
}
