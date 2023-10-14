import 'package:learning_demo/tabs_mvc/tabs_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/task.dart';

class TabsController extends ControllerMVC {

  static TabsController _tabsSingleton = TabsController._initSingleton();

  Map<Urgency, int> urgencyValues = {
    Urgency.high: 0,
    Urgency.medium: 1,
    Urgency.low: 2,
  };

  factory TabsController() {
    return _tabsSingleton;
  }

  TabsController._initSingleton();

  Task findBook(int id) => TabsModel.todoTasks.firstWhere((book) => book.id == id);

  List<Task> get todoTasks => TabsModel.todoTasks;
  List<Task> get inProgressTasks => TabsModel.inProgressTasks;
  List<Task> get doneTasks => TabsModel.doneTasks;

  void moveTaskToInProgress(Task task) {
    TabsModel.todoTasks.remove(task);
    task.progress = Progress.IN_PROGRESS;
    TabsModel.inProgressTasks.add(task);
  }

  void moveTaskToTodo(Task task) {
    TabsModel.inProgressTasks.remove(task);
    task.progress = Progress.TODO;
    TabsModel.todoTasks.add(task);
  }

  void moveTaskToDone(Task task) {
    TabsModel.inProgressTasks.remove(task);
    task.progress = Progress.DONE;
    TabsModel.doneTasks.add(task);
  }

  void createTask(String title, String description, Urgency urgency){
    TabsModel.todoTasks.add(Task(title: title, description: description, urgency: urgency));
  }

  void deleteTask(Task task) {
    if (task.progress == Progress.TODO) TabsModel.todoTasks.remove(task);
    else if (task.progress == Progress.IN_PROGRESS) TabsModel.inProgressTasks.remove(task);
    else if (task.progress == Progress.DONE) TabsModel.doneTasks.remove(task);
  }

  void editTask(Task editedTask) {
    if (editedTask.progress == Progress.TODO) getAndEditTask(todoTasks, editedTask);
    else if (editedTask.progress == Progress.IN_PROGRESS) getAndEditTask(inProgressTasks, editedTask);
    else if (editedTask.progress == Progress.DONE) getAndEditTask(doneTasks, editedTask);
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
    todoTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
    inProgressTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
    doneTasks.sort((a, b) => urgencyValues[a.urgency]!.compareTo(urgencyValues[b.urgency] as num));
  }

}
