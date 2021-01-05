import 'package:flutter/foundation.dart';
import 'package:your_todos/models/tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskcount {
    return _tasks.length;
  }

  void addTask(String newtaskdata) {
    final task = Task(name: newtaskdata);
    _tasks.add(task);
    notifyListeners();
  }

  void updatetask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removetask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
