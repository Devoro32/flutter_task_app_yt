import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_export.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //! depreciated BlocOverrides.runZoned: https://stackoverflow.com/questions/73685907/info-runzoned-is-deprecated-and-shouldnt-be-used-this-will-be-removed-in-v9
  //https://youtu.be/PD0eAXLd5ls?t=1096
  //***https://stackoverflow.com/questions/74504794/undefined-name-hydratedblocoverrides***
  //https://stackoverflow.com/questions/68911012/hydrated-bloc-the-parameter-storagedirectory-is-required

  //this allows for local storage on the phone

//https://youtu.be/PD0eAXLd5ls?t=2239
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  //taken from yt- which is depreciated and thus the above is used
  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );

  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //https://youtu.be/PD0eAXLd5ls?t=1169
      //adding the task manually for now
      create: (context) => TasksBloc(),
      //https://youtu.be/PD0eAXLd5ls?t=2070
      // ..add(AddTask(
      //   task: Task(title: 'Task1'),
      // )),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
