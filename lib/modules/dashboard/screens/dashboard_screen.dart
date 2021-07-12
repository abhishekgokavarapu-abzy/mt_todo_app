import 'package:flutter/material.dart';
import 'package:mt_todo_app/modules/dashboard/screens/add_task_screen.dart';
import 'package:mt_todo_app/modules/dashboard/widgets/dashboard_screen_body.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'dashboard_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: DashboardScreenBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddTaskScreen.id);
        },
      ),
    );
  }
}
