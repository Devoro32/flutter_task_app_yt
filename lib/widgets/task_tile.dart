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
  //https://youtu.be/PD0eAXLd5ls?t=3575
  void _removeOrDeleteTasks(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(
              task: task,
            ))
        : context.read<TasksBloc>().add(RemoveTask(
              task: task,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        //https://youtu.be/PD0eAXLd5ls?t=6097
        overflow: TextOverflow.ellipsis,
        //https://youtu.be/PD0eAXLd5ls?t=2550
        //when task is done put a line through
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged:
            //https://youtu.be/PD0eAXLd5ls?t=3921
            task.isDeleted == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
      ),
      onLongPress: () =>
          //https://youtu.be/PD0eAXLd5ls?t=3575
          //  context.read<TasksBloc>().add(
          //       DeleteTask(
          //         task: task,
          //       ),
          //     ),
          _removeOrDeleteTasks(context, task),
    );
  }
}
