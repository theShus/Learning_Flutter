class Task {
  String title;
  String description;
  Urgency urgency;
  Progress progress;

  Task({required this.title, required this.description, required this.urgency, this.progress = Progress.todo});
}

enum Urgency {high, medium, low}

enum Progress {todo, inProgress, done}