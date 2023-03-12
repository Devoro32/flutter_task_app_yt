import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';

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
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {},
              ),
            );
          }),
    );
  }
}
