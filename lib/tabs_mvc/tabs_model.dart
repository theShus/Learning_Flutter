import '../models/task.dart';

class TabsModel {

  static int globalId = 0;

  static List<Task> todoTasks = [
    Task(title: "Todo1", description: "description", urgency: Urgency.medium, progress: Progress.TODO),
    Task(title: "Todo2", description: "description2", urgency: Urgency.low, progress: Progress.TODO),
    Task(title: "Todo3", description: "description3", urgency: Urgency.high, progress: Progress.TODO),
  ];
  static List<Task> inProgressTasks = [];
  static List<Task> doneTasks = [];

  static int setTaskId(){
    return globalId++;
  }

}