import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final Function checkboxCallback;
  final Function longpresscallback;
  TaskTile(
      {this.tasktitle,
      this.isChecked,
      this.checkboxCallback,
      this.longpresscallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longpresscallback,
        title: Text(
          '$tasktitle',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkboxCallback));
  }
}
