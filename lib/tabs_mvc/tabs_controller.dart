import 'package:flutter/foundation.dart';
import 'package:learning_demo/tabs_mvc/tabs_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/task.dart';

class TabsController extends ControllerMVC {

  static TabsController _tabsSingleton = TabsController._initSingleton();

  factory TabsController() {
    return _tabsSingleton;
  }

  TabsController._initSingleton();


  List<Task> get todoTasks => TabsModel.todoTasks;
  List<Task> get inProgressTasks => TabsModel.inProgressTasks;
  List<Task> get doneTasks => TabsModel.doneTasks;

  void moveTaskToInProgress(Task task) {
    TabsModel.todoTasks.remove(task);
    TabsModel.inProgressTasks.add(task);
  }

  void moveTaskToTodo(Task task) {
    TabsModel.inProgressTasks.remove(task);
    TabsModel.todoTasks.add(task);
  }

  void moveTaskToDone(Task task) {
    TabsModel.inProgressTasks.remove(task);
    TabsModel.doneTasks.add(task);
  }

  void createTask(String title, String description, Urgency urgency){
    TabsModel.todoTasks.add(Task(title: title, description: description, urgency: urgency));
  }

  void deleteTask(Task task) {
    //todo napravi switch ili nekako saznaj gde se nalazi objekat, isto za edit
  }

  void editTask(Task task) {}
}
