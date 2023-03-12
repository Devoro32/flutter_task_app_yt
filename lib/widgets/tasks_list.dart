import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/blocs/bloc_export.dart';

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
          }),
    );
  }
}
