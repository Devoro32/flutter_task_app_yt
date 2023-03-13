import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskLists,
  }) : super(key: key);

  final List<Task> taskLists;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskLists.length,
          itemBuilder: (context, index) {
            var task = taskLists[index];
            //https://youtu.be/PD0eAXLd5ls?t=2586
            return TaskTile(task: task);
          }),
    );
  }
}
