import 'package:flutter/material.dart';
import 'package:mt_todo_app/modules/dashboard/widgets/task_screen_body.dart';

class AddTaskScreen extends StatelessWidget {
  static const String id = 'add_task_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: TaskScreenBody(),
    );
  }
}
