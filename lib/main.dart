import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

void main() {
  //! depreciated
  //https://youtu.be/PD0eAXLd5ls?t=1096
  BlocOverrides.runZoned(
    () => runApp(const TaskApp()),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //https://youtu.be/PD0eAXLd5ls?t=1169
      //adding the task manually for now
      create: (context) => TasksBloc(),
      //https://youtu.be/PD0eAXLd5ls?t=2070
      // ..add(AddTask(
      //   task: Task(title: 'Task1'),
      // )),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
