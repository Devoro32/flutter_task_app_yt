// ignore_for_file: public_member_api_docs, sort_constructors_first
//https://youtu.be/PD0eAXLd5ls?t=780

part of 'tasks_bloc.dart';

//https://youtu.be/PD0eAXLd5ls?t=2138
class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

//https://youtu.be/PD0eAXLd5ls?t=2138
//allows to convert the data into json and store it on the phone
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class TodosLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Task> allTasks;

  const TasksLoaded({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}
