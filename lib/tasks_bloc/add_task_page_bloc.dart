import 'package:flutter/material.dart';
import '../../models/task.dart';

class AddTaskPageBloc extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPageBloc> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Urgency selectedUrgency = Urgency.low;

  @override
  Widget build(BuildContext context) {
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
                  Task newTask = Task(title: titleController.text, description: descriptionController.text, urgency: selectedUrgency, progress: Progress.TODO);
                  Navigator.pop(context, newTask);//WE ARE RETURNING VALUE BACK TO THE CONTROLLER !!!
                },
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
