import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/modals/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        taskData.getTasks();
        return ListView.builder(
          itemBuilder: (
            context,
            index,
          ) {
            final task = taskData.tasks[index];
            return TaskTile(
              task.isDone,
              task.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task, checkboxState);
              },
              longPressCallback: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
