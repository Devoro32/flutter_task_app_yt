//https://youtu.be/PD0eAXLd5ls?t=7028

//https://youtu.be/PD0eAXLd5ls?t=1638

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({
    Key? key,
    required this.oldTask,
    //https://youtu.be/PD0eAXLd5ls?t=1670
    //required this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Column(
      children: [
        const Text(
          'Edit Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 6,
          decoration: const InputDecoration(
            label: Text('Description'),
            border: OutlineInputBorder(),
          ),
        ),

        //https://youtu.be/PD0eAXLd5ls?t=1458

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var editTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  //https://youtu.be/PD0eAXLd5ls?t=6740
                  date: DateTime.now().toString(),
                  //https://youtu.be/PD0eAXLd5ls?t=2415
                  //https://youtu.be/PD0eAXLd5ls?t=7123
                  id: oldTask.id,
                  isDone: false,
                  isFavorite: oldTask.isFavorite,
                );
                context.read<TasksBloc>().add(EditTask(
                      oldTask: oldTask,
                      newTask: editTask,
                    ));
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        ),
      ],
    );
  }
}
