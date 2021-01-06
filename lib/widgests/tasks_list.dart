import 'package:flutter/material.dart';
import 'package:your_todos/widgests/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:your_todos/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              tasktitle: taskdata.tasks[index].name,
              isChecked: taskdata.tasks[index].isDone,
              checkboxCallback: (bool checkboxstate) {
                taskdata.updatetask(taskdata.tasks[index]);
              },
              longpresscallback: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text(
                          "Are you sure you want to delete this task?"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        Row(
                          children: <Widget>[
                            new FlatButton(
                              child: new Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            new FlatButton(
                                onPressed: () {
                                  taskdata.removetask(taskdata.tasks[index]);
                                  Navigator.of(context).pop();
                                },
                                child: new Text("Yes"))
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}
//taskdata.removetask(taskdata.tasks[index]);
