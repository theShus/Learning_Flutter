import '../models/task.dart';

class TabsModel {

  static int globalId = 0;

  static List<Task> todoTasks = [
    Task(title: "Todo1", description: "description", urgency: Urgency.medium),
    Task(title: "Todo2", description: "description2", urgency: Urgency.low),
    Task(title: "Todo3", description: "description3", urgency: Urgency.high),
  ];
  static List<Task> inProgressTasks = [];
  static List<Task> doneTasks = [];

  static int setTaskId(){
    return globalId++;
  }

}