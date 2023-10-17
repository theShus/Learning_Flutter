import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../models/task.dart';
import '../../tasks_mvc/tabs_controller.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;

  EditTaskPage({required this.task});

  @override
  _EditTaskPageState createState() => _EditTaskPageState(task.urgency);
}

class _EditTaskPageState extends State<EditTaskPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Urgency selectedUrgency = Urgency.low;

  _EditTaskPageState(this.selectedUrgency);//this is a little ugly but can't be done differently aka with widget
                                          //if done with widget it will perma lock it on old value

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Urgency:'),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Radio<Urgency>(
                      value: Urgency.high,
                      groupValue: selectedUrgency,
                      onChanged: (Urgency? value) {
                        setState(() {
                          selectedUrgency = value!;
                        });
                      },
                    ),
                    Text('High'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Urgency>(
                      value: Urgency.medium,
                      groupValue: selectedUrgency,
                      onChanged: (Urgency? value) {
                        setState(() {
                          selectedUrgency = value!;
                        });
                      },
                    ),
                    Text('Medium'),
                  ],
                ),
                Row(
                  children: [
                    Radio<Urgency>(
                      value: Urgency.low,
                      groupValue: selectedUrgency,
                      onChanged: (Urgency? value) {
                        setState(() {
                          selectedUrgency = value!;
                        });
                      },
                    ),
                    Text('Low'),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Task editedTask = Task(title: titleController.text, description: descriptionController.text, urgency: selectedUrgency, progress: Progress.TODO);
                  editedTask.id = widget.task.id;
                  Navigator.pop(context, editedTask);//WE ARE RETURNING VALUE BACK TO THE CONTROLLER !!!
                },
                child: Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
