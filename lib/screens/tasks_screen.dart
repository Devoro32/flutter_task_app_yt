import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

import '../blocs/bloc_export.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  //https://youtu.be/PD0eAXLd5ls?t=1190
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Add Task',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/PD0eAXLd5ls?t=1129
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text('Tasks:'),
                ),
              ),

              //https://youtu.be/PD0eAXLd5ls?t=989 - add a task method
              TasksList(
                taskLists: tasksList,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            //https://youtu.be/PD0eAXLd5ls?t=1305
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
