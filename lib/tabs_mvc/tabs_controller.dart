import 'package:learning_demo/tabs_mvc/interface/tabs_controller_interface.dart';
import 'package:learning_demo/tabs_mvc/tabs_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/task.dart';

class TabsController extends ControllerMVC implements TabsControllerInterface {

  static TabsController instance = TabsController._initSingleton();

  Map<Urgency, int> urgencyValues = {
    Urgency.high: 0,
    Urgency.medium: 1,
    Urgency.low: 2,
  };

  TabsController._initSingleton();

  factory TabsController() {
    return instance;
  }


  @override
  List<Task> getTodoTasks() {
    sortTasksByUrgency();
    return TabsModel.todoTasks;
  }

  @override
  List<Task> getInProgressTasks() {
    sortTasksByUrgency();
    return TabsModel.inProgressTasks;
  }

  @override
  List<Task> getDoneTasks() {
    sortTasksByUrgency();
    return TabsModel.todoTasks;
  }

  @override
  void moveTaskToInProgress(Task task) {
    TabsModel.todoTasks.remove(task);
    task.progress = Progress.IN_PROGRESS;
    TabsModel.inProgressTasks.add(task);
  }

  @override
  void moveTaskToTodo(Task task) {
    TabsModel.inProgressTasks.remove(task);
    task.progress = Progress.TODO;
    TabsModel.todoTasks.add(task);
  }

  @override
  void moveTaskToDone(Task task) {
    TabsModel.inProgressTasks.remove(task);
    task.progress = Progress.DONE;
    TabsModel.doneTasks.add(task);
  }

  @override
  void createTask(Task task){
    TabsModel.todoTasks.add(Task(title: task.title, description: task.description, urgency: task.urgency, progress: Progress.TODO));
  }

  @override
  void deleteTask(Task task) {
    if (task.progress == Progress.TODO) TabsModel.todoTasks.remove(task);
    else if (task.progress == Progress.IN_PROGRESS) TabsModel.inProgressTasks.remove(task);
    else if (task.progress == Progress.DONE) TabsModel.doneTasks.remove(task);
  }

  @override
  void editTask(Task editedTask) {
    if (editedTask.progress == Progress.TODO) getAndEditTask(getTodoTasks(), editedTask);
    else if (editedTask.progress == Progress.IN_PROGRESS) getAndEditTask(getInProgressTasks(), editedTask);
    else if (editedTask.progress == Progress.DONE) getAndEditTask(getDoneTasks(), editedTask);
    sortTasksByUrgency();
  }

  void getAndEditTask(List<Task> taskList, Task editedTask) {
    for (Task task in taskList) {
      print(task.toString());
      if (task.id == editedTask.id) {
        task.title = editedTask.title;
        task.description = editedTask.description;
        task.urgency = editedTask.urgency;
        break;
      }
    }
  }

  void sortTasksByUrgency(){
    TabsModel.todoTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
    TabsModel.inProgressTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
    TabsModel.doneTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
  }

}
