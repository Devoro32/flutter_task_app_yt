import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/screens/my_drawer.dart';
import 'package:tasks_app/widgets/tasks_list.dart';
import 'package:tasks_app/screens/add_task_screen.dart';

import '../blocs/bloc_export.dart';

//https://youtu.be/PD0eAXLd5ls?t=1710
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

//https://youtu.be/PD0eAXLd5ls?t=2970
  static const id = 'tasks_screen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  //https://youtu.be/PD0eAXLd5ls?t=1190
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      //https://www.kindacode.com/article/flutter-bottom-sheet-examples/#Modal_Bottom_Sheet_with_Text_Fields_inside
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              //adding  +15 so that the keyboard doesn't cover the text field
              bottom: MediaQuery.of(context).viewInsets.bottom + 15),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const AddTaskScreen(),
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
                onPressed: () => _addTask(context),
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
                  label: Text(' ${state.allTasks.length} Task'),
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
