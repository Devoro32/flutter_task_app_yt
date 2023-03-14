// ignore_for_file: public_member_api_docs, sort_constructors_first
//https://youtu.be/PD0eAXLd5ls?t=780

part of 'tasks_bloc.dart';

//https://youtu.be/PD0eAXLd5ls?t=2138
class TasksState extends Equatable {
  final List<Task> pendingTasks;
  //https://youtu.be/PD0eAXLd5ls?t=3318
  final List<Task> removedTasks;
  //https://youtu.be/PD0eAXLd5ls?t=5184
  final List<Task> favoriteTasks;
  final List<Task> completedTasks;
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.removedTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
        removedTasks,
      ];

//https://youtu.be/PD0eAXLd5ls?t=2138
//allows to convert the data into json and store it on the phone
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favoriteTasks: List<Task>.from(
        (map['favoriteTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
        //https://youtu.be/PD0eAXLd5ls?t=5230
      ),
    );
  }
}

class TodosLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Task> pendingTasks;

  const TasksLoaded({this.pendingTasks = const <Task>[]});

  @override
  List<Object> get props => [pendingTasks];
}
