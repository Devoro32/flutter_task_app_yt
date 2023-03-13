//https://youtu.be/PD0eAXLd5ls?t=879

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/blocs/bloc_export.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

//https://youtu.be/PD0eAXLd5ls?t=960
//https://youtu.be/PD0eAXLd5ls?t=2110
class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    late final state = this.state;

    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    //https://youtu.be/PD0eAXLd5ls?t=1783
    final state = this.state;
    final task = event.task;

    //https://youtu.be/PD0eAXLd5ls?t=1914
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        //https://youtu.be/PD0eAXLd5ls?t=1914
        // ? allTasks.add(task.copyWith(isDone: true))
        // : allTasks.add(task.copyWith(isDone: false));
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    //https://youtu.be/PD0eAXLd5ls?t=1985
    final state = this.state;

    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..remove(event.task),
      ),
    );
  }

//https://youtu.be/PD0eAXLd5ls?t=2138
  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

//https://youtu.be/PD0eAXLd5ls?t=2138
  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
