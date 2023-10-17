import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/tasks_bloc/task_event.dart';
import 'package:learning_demo/tasks_bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState>{
  TaskBloc() : super (TaskLoading()){
    on<LoadTasks> (_OnLoadTasks);
    on<AddTask> (_AddTasks);
    on<UpdateTask> (_UpdateTasks);
    on<DeleteTask> (_DeleteTasks);
  }


  void _OnLoadTasks(LoadTasks event, Emitter<TaskState> emit){
    emit (TaskLoaded(todoTasks: event.todoTasks, inProgressTasks: event.inProgressTasks, doneTasks: event.doneTasks));
  }

  void _AddTasks(AddTask event, Emitter<TaskState> emit){
    
  }

  void _UpdateTasks(UpdateTask event, Emitter<TaskState> emit){

  }

  void _DeleteTasks(DeleteTask event, Emitter<TaskState> emit){

  }

}