import 'dart:ffi';

import 'package:learning_demo/tabs_mvc/tabs_model.dart';

class Task {
  int id = TabsModel.setTaskId();
  String title;
  String description;
  Urgency urgency;
  Progress progress;

  Task({required this.title, required this.description, required this.urgency, this.progress = Progress.TODO});

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, urgency: $urgency, progress: $progress}';
  }
}

enum Urgency {high, medium, low}

enum Progress {TODO, IN_PROGRESS, DONE}