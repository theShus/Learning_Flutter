import 'package:equatable/equatable.dart';
import '../../models/task.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent{
  final List<Task> todoTasks;
  final List<Task> inProgressTasks;
  final List<Task> doneTasks;

  const LoadTasks({this.todoTasks = const <Task>[], this.inProgressTasks = const <Task>[], this.doneTasks = const <Task>[]});

  @override
  List<Object> get props  => [todoTasks, inProgressTasks, doneTasks];
}

class AddTask extends TaskEvent{
  final Task task;
  const AddTask({required this.task});

  @override
  List<Object> get props  => [task];
}

class UpdateTask extends TaskEvent{
  final Task task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props  => [task];
}

class DeleteTask extends TaskEvent{
  final Task task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props  => [task];
}

class MoveTaskToInProgress extends TaskEvent{
  final Task task;
  const MoveTaskToInProgress({required this.task});

  @override
  List<Object> get props  => [task];
}

class MoveTaskToDone extends TaskEvent{
  final Task task;
  const MoveTaskToDone({required this.task});

  @override
  List<Object> get props  => [task];
}

class MoveTaskToTodo extends TaskEvent{
  final Task task;
  const MoveTaskToTodo({required this.task});

  @override
  List<Object> get props  => [task];
}
