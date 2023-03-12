//https://youtu.be/PD0eAXLd5ls?t=780
part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];
}

class TodosLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Task> allTasks;

  const TasksLoaded({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];
}
