import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/tasks_bloc/components/task_event.dart';
import 'package:learning_demo/tasks_bloc/components/task_state.dart';

import '../../models/task.dart';
import '../../tasks_mvc/tabs_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TasksLoading()) {
    on<LoadTasks>(_OnLoadTasks);
    on<AddTask>(_AddTasks);
    on<UpdateTask>(_UpdateTasks);
    on<DeleteTask>(_DeleteTasks);
  }

  void _OnLoadTasks(LoadTasks event, Emitter<TaskState> emit) {
    emit(TasksLoaded(
        todoTasks: event.todoTasks,
        doneTasks: event.doneTasks,
        inProgressTasks: event.inProgressTasks));
  }

  //== poredjuje da li su dve vrednosti iste
  //dok 'is' proverava da li je neki objekat instanca neke klase ili interface-a
  void _AddTasks(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      emit(TasksLoaded(
          todoTasks: List.from(state.todoTasks)..add(event.task),
          //..add je samo kao ++ ali za funkcije
          inProgressTasks: List.from(state.inProgressTasks),
          //radimo List.from jer hocemo novu instancu liste, a ne pointer
          doneTasks: List.from(state.doneTasks)));
    }
  }

  void _UpdateTasks(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    
    if (state is TasksLoaded) {
      if (event.task.progress == Progress.TODO) getAndEditTask(state.todoTasks, event.task);
      else if (event.task.progress == Progress.IN_PROGRESS) getAndEditTask(state.inProgressTasks, event.task);
      else if (event.task.progress == Progress.DONE) getAndEditTask(state.doneTasks, event.task);

      emit(TasksLoaded(
          todoTasks: List.from(state.todoTasks),
          inProgressTasks: List.from(state.inProgressTasks),
          doneTasks: List.from(state.doneTasks)
      ));
    }
  }

  void _DeleteTasks(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;

    if (state is TasksLoaded) {
      if (event.task.progress == Progress.TODO) state.todoTasks.remove(event.task);
      else if (event.task.progress == Progress.IN_PROGRESS) state.inProgressTasks.remove(event.task);
      else if (event.task.progress == Progress.DONE) state.doneTasks.remove(event.task);

      emit(TasksLoaded(
          todoTasks: List.from(state.todoTasks),
          inProgressTasks: List.from(state.inProgressTasks),
          doneTasks: List.from(state.doneTasks)
      ));
    }
  }

  void getAndEditTask(List<Task> taskList, Task editedTask) {
    print("USLI SMO U SEARCH");
    for (Task task in taskList) {
      print("POREDIMO:");
      print(task.toString());
      print(editedTask);
      if (task.id == editedTask.id) {
        print("NASLI SMO GA");
        task.title = editedTask.title;
        task.description = editedTask.description;
        task.urgency = editedTask.urgency;
        break;
      }
    }
  }
}
