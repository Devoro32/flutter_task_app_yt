import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

import '../blocs/bloc_export.dart';

//https://youtu.be/PD0eAXLd5ls?t=1710
class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

//https://youtu.be/PD0eAXLd5ls?t=2970
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/PD0eAXLd5ls?t=1129
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                //https://youtu.be/PD0eAXLd5ls?t=2628
                label: Text(
                    ' ${state.pendingTasks.length} Pending| ${state.completedTasks.length} Completed'),
              ),
            ),

            //https://youtu.be/PD0eAXLd5ls?t=989 - add a task method
            TasksList(
              taskLists: tasksList,
            )
          ],
        );
      },
    );
  }
}
