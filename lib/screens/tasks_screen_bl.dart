import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

import '../blocs/bloc_export.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

//https://youtu.be/PD0eAXLd5ls?t=570
//temporary  task list
  List<Task> tasksList = [
    Task(
        title: 'Task 1',
        description: ' text description',
        id: '1',
        date: 'yymmdd'),
    Task(
        title: 'Task 2',
        description: ' text description',
        id: '2',
        date: 'yymmdd'),
    Task(
        title: 'Task 3',
        description: ' text description',
        id: '3',
        date: 'yymmdd'),
  ];

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/PD0eAXLd5ls?t=1129
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
          //TasksList(taskLists: taskLists)
          //https://youtu.be/PD0eAXLd5ls?t=598
          Expanded(
            child: ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: ((context, index) {
                var task = tasksList[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {},
                  ),
                );
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
