import 'package:flutter/material.dart';
import 'package:mt_todo_app/config/modals/task.dart';
import 'package:mt_todo_app/config/modals/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController ted = TextEditingController();
    String name;
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'MT Todo App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' Tasks', //${Provider.of<TaskData>(context).taskCount}
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: ted,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          hintText: 'Enter Task',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0),
                          contentPadding: EdgeInsets.only(left: 25.0),
                          fillColor: Colors.grey,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(5, 5)))),
                    ),
                    Consumer<TaskData>(
                        builder: (context, taskData, widget) => ElevatedButton(
                            onPressed: () {
                              name = ted.value.text;
                              taskData.addTask(Task(name));
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.indigo)),
                            child: Text(
                              'ADD TASK',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18.0),
                            )))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
