//https://youtu.be/PD0eAXLd5ls?t=2603
import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/models/tasks.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        //https://youtu.be/PD0eAXLd5ls?t=2550
        //when task is done put a line through
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
      ),
      onLongPress: () => context.read<TasksBloc>().add(
            DeleteTask(
              task: task,
            ),
          ),
    );
  }
}
