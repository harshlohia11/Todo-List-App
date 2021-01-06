import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_todos/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  String newtasktitle;
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 40.0),
            ),
            TextField(
              onChanged: (newvalue) {
                newtasktitle = newvalue;
              },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newtasktitle != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newtasktitle);
                }

                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
