class Task {
  int? id;
  String title;
  String description;
  Urgency urgency;
  Progress progress;

  Task({this.id, required this.title, required this.description, required this.urgency, required this.progress});
  // Task({required this.title, required this.description, required this.urgency, this.progress = Progress.TODO});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'urgency': urgency,
      'progress': progress,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        urgency: map['urgency'],
        progress: map['progress'],
    );
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, urgency: $urgency, progress: $progress}';
  }
}

enum Urgency {high, medium, low}

enum Progress {TODO, IN_PROGRESS, DONE}