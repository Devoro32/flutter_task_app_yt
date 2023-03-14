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
    //https://youtu.be/PD0eAXLd5ls?t=5605
    //https://youtu.be/PD0eAXLd5ls?t=5992
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: taskLists
                .map(
                  (task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) => TaskTile(task: task),
                    //https://youtu.be/PD0eAXLd5ls?t=5865
                    body:
                        //move the text to the left
                        ListTile(
                      title: SelectableText.rich(
                        TextSpan(children: [
                          const TextSpan(
                            text: 'Task:\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: task.title),
                          const TextSpan(
                            text: '\nDescription:\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: task.description),
                        ]),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}

    //https://youtu.be/PD0eAXLd5ls?t=5605

// Expanded(
//       child: ListView.builder(
//           itemCount: taskLists.length,
//           itemBuilder: (context, index) {
//             var task = taskLists[index];
//             //https://youtu.be/PD0eAXLd5ls?t=2586
//             return TaskTile(task: task);
//           }),
//     );