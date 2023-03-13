//https://youtu.be/PD0eAXLd5ls?t=2880

import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/screens/my_drawer.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  //https://youtu.be/PD0eAXLd5ls?t=2970
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  //https://youtu.be/PD0eAXLd5ls?t=2628
                  label: Text(' ${state.removedTasks.length} Task'),
                ),
              ),

              //https://youtu.be/PD0eAXLd5ls?t=989 - add a task method
              TasksList(
                taskLists: state.removedTasks,
              )
            ],
          ),
        );
      },
    );
  }
}
