import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

import '../blocs/bloc_export.dart';

//https://youtu.be/PD0eAXLd5ls?t=1710
class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

//https://youtu.be/PD0eAXLd5ls?t=2970
  static const id = 'completed_screen';

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/PD0eAXLd5ls?t=1129
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                //https://youtu.be/PD0eAXLd5ls?t=2628
                //https://youtu.be/PD0eAXLd5ls?t=5464
                label: Text(' ${tasksList.length} Task'),
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
