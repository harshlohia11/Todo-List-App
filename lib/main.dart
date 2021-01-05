import 'package:flutter/material.dart';
import 'sceeens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:your_todos/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
