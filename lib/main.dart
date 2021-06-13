import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mt_todo_app/config/constants/constants.dart';
import 'package:mt_todo_app/config/modals/task.dart';
import 'package:mt_todo_app/config/modals/task_data.dart';
import 'package:mt_todo_app/modules/dashboard/screens/add_task_screen.dart';
import 'package:mt_todo_app/modules/dashboard/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(ListenableProvider(create: (context) => TaskData(), child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MT Todo App',
      theme: kThemeData,
      initialRoute: DashboardScreen.id,
      routes: {
        DashboardScreen.id: (context) => DashboardScreen(),
        AddTaskScreen.id: (context) => AddTaskScreen()
      },
    );
  }
}
