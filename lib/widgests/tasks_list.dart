import 'package:flutter/material.dart';
import 'package:your_todos/widgests/tasks_tile.dart';
import 'package:your_todos/models/tasks.dart';
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
                taskdata.removetask(taskdata.tasks[index]);
              },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}
