import '../../models/task.dart';

abstract class TabsControllerInterface {

  List<Task> getTodoTasks();
  List<Task> getInProgressTasks();
  List<Task> getDoneTasks();

  void moveTaskToInProgress(Task task);
  void moveTaskToTodo(Task task);
  void moveTaskToDone(Task task);

  void createTask(Task task);
  void deleteTask(Task task);
  void editTask(Task task);

}