//https://youtu.be/PD0eAXLd5ls?t=2662
import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Colors.grey[200],
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            //https://youtu.be/PD0eAXLd5ls?t=3107
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    TasksScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Task'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    RecycleBin.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
