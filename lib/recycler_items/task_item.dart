import 'package:flutter/material.dart';
import '../models/task.dart';

enum CallbackFunctionType {DELETE, EDIT, RIGHT, LEFT}

class TaskItem extends StatelessWidget {
  final Task task;
  // final VoidCallback onButtonPressed;
  final Function(CallbackFunctionType, Task) onButtonPressed;

  TaskItem({Key? key, required this.task, required this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.grey, width: 1.0), // Add a line separator
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(text: task.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  TextSpan(text: '\n- Urgency: ',),
                  if (task.urgency == Urgency.low)
                    _urgencyText(Colors.orangeAccent)
                  else if (task.urgency == Urgency.medium)
                    _urgencyText(Colors.deepOrangeAccent)
                  else _urgencyText(Colors.red)
                ],
              ),
            ),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              // Ensure the Row takes minimum space
              children: [
                _roundedButton(Icons.edit, Colors.grey, () {
                  onButtonPressed(CallbackFunctionType.EDIT, task);
                }),
                _roundedButton(Icons.delete, Colors.redAccent, () {
                  onButtonPressed(CallbackFunctionType.DELETE, task);
                }),
                if (task.progress == Progress.IN_PROGRESS)
                  _roundedButton(Icons.arrow_back, Colors.orange, () {
                    onButtonPressed(CallbackFunctionType.LEFT, task);
                  }),
                if (task.progress != Progress.DONE)
                  _roundedButton(Icons.arrow_forward, Colors.orange, () {
                    onButtonPressed(CallbackFunctionType.RIGHT, task);
                  }),
              ],
            ),
          ),
        ),
        Divider(height: 0.0, color: Colors.grey), // Add a divider at the bottom
      ],
    );
  }

  Widget _roundedButton(IconData icon, Color color, VoidCallback onPressed) {
    return Row(
      children: [
        SizedBox(height: 0, width: 15),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }

  TextSpan _urgencyText(Color color){
    return TextSpan(
        text: '${task.urgency.toString().split('.').last}',
        style: TextStyle(fontWeight: FontWeight.bold,
        color: color)
    );
  }
}
