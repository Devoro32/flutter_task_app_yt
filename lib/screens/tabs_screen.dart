//https://youtu.be/PD0eAXLd5ls?t=4697
import 'package:flutter/material.dart';
import 'package:tasks_app/screens/add_task_screen.dart';
import 'package:tasks_app/screens/completed_tasks.dart';
import 'package:tasks_app/screens/favorite_tasks.dart';
import 'package:tasks_app/screens/my_drawer.dart';
import 'package:tasks_app/screens/pending_screen.dart';

class TabsScreen extends StatefulWidget {
  //https://youtu.be/PD0eAXLd5ls?t=5117
  const TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //https://youtu.be/PD0eAXLd5ls?t=5034
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  var _selectedPageIndex = 0;

//https://youtu.be/PD0eAXLd5ls
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      //https://www.kindacode.com/article/flutter-bottom-sheet-examples/#Modal_Bottom_Sheet_with_Text_Fields_inside
      //https://youtu.be/PD0eAXLd5ls?t=5865
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
    return Scaffold(
      //https://youtu.be/PD0eAXLd5ls?t=4775
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              //https://youtu.be/PD0eAXLd5ls?t=1305
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,

      //https://youtu.be/PD0eAXLd5ls?t=4826
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Pending Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Tasks',
          )
        ],
      ),
    );
  }
}
