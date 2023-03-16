//https://youtu.be/PD0eAXLd5ls?t=2603
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/screens/edit_task_screen.dart';
import 'package:tasks_app/widgets/popup_menu.dart';

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

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      //https://youtu.be/PD0eAXLd5ls?t=7260
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              //adding  +15 so that the keyboard doesn't cover the text field
              bottom: MediaQuery.of(context).viewInsets.bottom + 15),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: EditTaskScreen(
              oldTask: task,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/PD0eAXLd5ls?t=6168
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                //https://youtu.be/PD0eAXLd5ls?t=6982
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      //https://youtu.be/PD0eAXLd5ls?t=6346
                      //https://youtu.be/PD0eAXLd5ls?t=6799
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          // .format(DateTime.now())),
                          //https://youtu.be/PD0eAXLd5ls?t=6799
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              //https://youtu.be/PD0eAXLd5ls?t=6415
              PopupMenu(
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTasks(context, task),
                //https://youtu.be/PD0eAXLd5ls?t=6954
                likeOrDislikeCallback: () => context.read<TasksBloc>()
                  ..add(MarkFavoriteOrUnfavoriteTask(task: task)),
                editTalkCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
                restoreTalkCallback: () =>
                    context.read<TasksBloc>().add(RestoreTask(task: task)),
              )
            ],
          ),
        ],
      ),
    );
  }
}


//https://youtu.be/PD0eAXLd5ls?t=6160
// ListTile(
//       title: Text(
//         task.title,
//         //https://youtu.be/PD0eAXLd5ls?t=6097
//         overflow: TextOverflow.ellipsis,
//         //https://youtu.be/PD0eAXLd5ls?t=2550
//         //when task is done put a line through
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged:
//             //https://youtu.be/PD0eAXLd5ls?t=3921
//             task.isDeleted == false
//                 ? (value) {
//                     context.read<TasksBloc>().add(UpdateTask(task: task));
//                   }
//                 : null,
//       ),
//       onLongPress: () =>
//           //https://youtu.be/PD0eAXLd5ls?t=3575
//           //  context.read<TasksBloc>().add(
//           //       DeleteTask(
//           //         task: task,
//           //       ),
//           //     ),
//           _removeOrDeleteTasks(context, task),
//     );
