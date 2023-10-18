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
    // emit();
  }

  void _DeleteTasks(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;

    if (state is TasksLoaded) {
      List<Task> newTodoTasks = List.of(state.todoTasks);
      List<Task> newInProgressTasks = List.of(state.inProgressTasks);
      List<Task> newDoneTasks = List.of(state.doneTasks);

      if (event.task.progress == Progress.TODO)
        newTodoTasks = List.of(state.todoTasks)..remove(event.task);
      else if (event.task.progress == Progress.IN_PROGRESS)
        newInProgressTasks = List.of(state.todoTasks)..remove(event.task);
      else if (event.task.progress == Progress.DONE)
        newDoneTasks = List.of(state.todoTasks)..remove(event.task);

      emit(TasksLoaded(todoTasks: newTodoTasks, inProgressTasks: newInProgressTasks, doneTasks: newDoneTasks));
    }
  }
}
